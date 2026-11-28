#!/usr/bin/env bash
#     ____                  __        ____
#    / __ \____ ___________/ /_____ _/ / /
#   / /_/ / __ `/ ___/ ___/ __/ __ `/ / /
#  / ____/ /_/ / /__(__  ) /_/ /_/ / / /
# /_/    \__,_/\___/____/\__/\__,_/_/_/
#
# Copyright (C) 2020-present
#
# This file is part of Pacstall
#
# Pacstall is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License
#
# Pacstall is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Pacstall. If not, see <https://www.gnu.org/licenses/>.
#
# @file resolve-ci-matrix.sh
# @brief Resolve CI test matrix OSes and per-package compatibility from .SRCINFO.
# @description
#   Reads compatible/incompatible fields from changed packages' .SRCINFO files,
#   maps active Ubuntu/Debian series via distro-info-data CSVs to Docker tags,
#   and checks whether the current container matches a given pacscript.

set -euo pipefail

DEFAULT_OS=(
  "ubuntu:latest"
  "ubuntu:devel"
  "ubuntu:rolling"
  "debian:stable"
  "debian:testing"
  "debian:unstable"
)

DISTRO_INFO_BASE="https://salsa.debian.org/debian/distro-info-data/-/raw/main"
LOCAL_DISTRO_INFO="/usr/share/distro-info"
TODAY="$(date +'%Y-%m-%d')"

load_csv() {
  local distro="${1}"
  local content=""
  if content="$(curl -fsSL "${DISTRO_INFO_BASE}/${distro}.csv" 2> /dev/null)"; then
    printf '%s\n' "${content}"
    return 0
  fi
  if [[ -r "${LOCAL_DISTRO_INFO}/${distro}.csv" ]]; then
    cat "${LOCAL_DISTRO_INFO}/${distro}.csv"
    return 0
  fi
  echo "Error: could not load distro-info CSV for ${distro}" >&2
  return 1
}

# Build tab-separated distro table:
# distro \t series \t version \t is_released(0|1) \t is_lts(0|1) \t docker_tag
build_distro_table() {
  local ubuntu_csv debian_csv
  ubuntu_csv="$(load_csv ubuntu)"
  debian_csv="$(load_csv debian)"

  awk -F ',' -v today="${TODAY}" '
    NR > 1 {
      series = tolower($3)
      gsub(/^[ \t]+|[ \t]+$/, "", series)
      ver = tolower($1)
      is_lts = (index(ver, "lts") > 0) ? 1 : 0
      gsub(/ lts/, "", ver)
      gsub(/^[ \t]+|[ \t]+$/, "", ver)
      created = $4
      release = $5
      eol = $6
      eol_server = $7
      if (series == "" || created == "" || created > today) next
      if (!(eol > today || eol_server > today || eol == "")) next
      released = (release != "" && release <= today) ? 1 : 0
      tag = released ? ("ubuntu:" series) : "ubuntu:devel"
      printf "ubuntu|%s|%s|%d|%d|%s\n", series, ver, released, is_lts, tag
    }
  ' <<< "${ubuntu_csv}"

  awk -F ',' -v today="${TODAY}" '
    NR > 1 {
      series = tolower($3)
      gsub(/^[ \t]+|[ \t]+$/, "", series)
      ver = tolower($1)
      gsub(/^[ \t]+|[ \t]+$/, "", ver)
      created = $4
      release = $5
      eol = $6
      eol_lts = $7
      if (series == "" || series == "experimental" || series == "rc-buggy") next
      if (created != "" && created > today) next
      if (!(eol > today || eol_lts > today || eol == "")) next
      if (series == "sid") {
        released = 0
        tag = "debian:unstable"
      } else if (release != "" && release <= today) {
        released = 1
        tag = "debian:" series
      } else {
        released = 0
        tag = "debian:testing"
      }
      printf "debian|%s|%s|%d|0|%s\n", series, ver, released, tag
    }
  ' <<< "${debian_csv}"
}

add_unique() {
  local -n arr="${1}"
  local val="${2}"
  local existing
  for existing in "${arr[@]+"${arr[@]}"}"; do
    [[ ${existing} == "${val}" ]] && return 0
  done
  arr+=("${val}")
}

# Check if a default OS tag matches an incompatible spec
default_matches_incompat() {
  local os_tag="${1}"
  local spec="${2}"
  local table="${3}"
  local line d s v rel lts tag
  local target_d="" target_s="" target_v=""

  if [[ ${spec} == "${os_tag}" ]]; then
    return 0
  fi

  case "${os_tag}" in
    ubuntu:latest)
      line="$(awk -F '|' '$1=="ubuntu" && $4==1 && $5==1 {l=$0} END {print l}' <<< "${table}")"
      ;;
    ubuntu:rolling)
      line="$(awk -F '|' '$1=="ubuntu" && $4==1 {l=$0} END {print l}' <<< "${table}")"
      ;;
    ubuntu:devel)
      line="$(awk -F '|' '$1=="ubuntu" && $4==0 {l=$0} END {print l}' <<< "${table}")"
      ;;
    debian:stable)
      line="$(awk -F '|' '$1=="debian" && $4==1 {l=$0} END {print l}' <<< "${table}")"
      ;;
    debian:testing)
      line="$(awk -F '|' '$1=="debian" && $4==0 && $2!="sid" {print; exit}' <<< "${table}")"
      ;;
    debian:unstable)
      target_d="debian"
      target_s="sid"
      target_v=""
      ;;
    *)
      return 1
      ;;
  esac

  if [[ -n ${line:-} ]]; then
    IFS='|' read -r target_d target_s target_v rel lts tag <<< "${line}"
  elif [[ -z ${target_d} ]]; then
    return 1
  fi

  case "${spec}" in
    "${target_d}:${target_s}" | "${target_d}:*" | "*:${target_s}")
      return 0
      ;;
    "${target_d}:${target_v}" | "*:${target_v}")
      [[ -n ${target_v} ]] && return 0
      ;;
    *)
      return 1
      ;;
  esac
  return 1
}

expand_compatible() {
  local table="${1}"
  shift
  local specs=("$@")
  local spec d_spec v_spec matched line d s v rel lts tag
  local -a out=()

  for spec in "${specs[@]}"; do
    [[ ${spec} == *:* ]] || continue
    case "${spec}" in
      ubuntu:devel | debian:testing | debian:unstable)
        add_unique out "${spec}"
        continue
        ;;
      *) ;;
    esac
    d_spec="${spec%%:*}"
    v_spec="${spec#*:}"
    matched=0
    while IFS='|' read -r d s v rel lts tag; do
      [[ -n ${d} ]] || continue
      if [[ ${d_spec} == "*" || ${d_spec} == "${d}" ]]; then
        if [[ ${v_spec} == "*" || ${v_spec} == "${s}" || (-n ${v} && ${v_spec} == "${v}") ]]; then
          matched=1
          add_unique out "${tag}"
        fi
      fi
    done <<< "${table}"
    if ((matched == 0)); then
      echo "Error: compatible entry '${spec}' matched no active distro in distrolist" >&2
      return 1
    fi
  done

  if ((${#out[@]} == 0)); then
    echo "Error: compatible list resolved to empty OS list" >&2
    return 1
  fi
  printf '%s\n' "${out[@]}"
}

filter_incompatible() {
  local table="${1}"
  shift
  local specs=("$@")
  local os_tag spec blocked
  local -a out=()

  for os_tag in "${DEFAULT_OS[@]}"; do
    blocked=0
    for spec in "${specs[@]}"; do
      # shellcheck disable=SC2310
      if default_matches_incompat "${os_tag}" "${spec}" "${table}"; then
        blocked=1
        break
      fi
    done
    ((blocked == 0)) && out+=("${os_tag}")
  done

  if ((${#out[@]} == 0)); then
    echo "Error: incompatible entries (${specs[*]}) excluded all default CI OSes" >&2
    return 1
  fi
  printf '%s\n' "${out[@]}"
}

check_current_os() {
  local pacscript="${1}"
  local pkg_dir srcinfo
  pkg_dir="$(dirname "${pacscript}")"
  srcinfo="${pkg_dir}/.SRCINFO"
  if [[ ! -f ${srcinfo} ]]; then
    echo "Error: missing .SRCINFO for ${pacscript}" >&2
    return 1
  fi

  local -a compat=() incompat=()
  mapfile -t compat < <(awk -F ' = ' '/^[ \t]*compatible = / {v=tolower($2); gsub(/^[ \t]+|[ \t]+$/, "", v); if (v!="" && !seen[v]++) print v}' "${srcinfo}")
  mapfile -t incompat < <(awk -F ' = ' '/^[ \t]*incompatible = / {v=tolower($2); gsub(/^[ \t]+|[ \t]+$/, "", v); if (v!="" && !seen[v]++) print v}' "${srcinfo}")

  if ((${#compat[@]} == 0 && ${#incompat[@]} == 0)); then
    return 0
  fi

  local os_id="" os_codename="" os_ver=""
  if [[ -r /etc/os-release ]]; then
    os_id="$(awk -F '=' '/^ID=/ {gsub(/"/, "", $2); print tolower($2)}' /etc/os-release)"
    os_codename="$(awk -F '=' '/^VERSION_CODENAME=/ {gsub(/"/, "", $2); print tolower($2)}' /etc/os-release)"
    os_ver="$(awk -F '=' '/^VERSION_ID=/ {gsub(/"/, "", $2); print tolower($2)}' /etc/os-release)"
  fi

  local spec d_spec v_spec matched=0
  local current_tag="${MATRIX_OS:-}"

  if ((${#compat[@]} > 0)); then
    for spec in "${compat[@]}"; do
      [[ ${spec} == *:* ]] || continue
      if [[ -n ${current_tag} && ${spec} == "${current_tag}" ]]; then
        matched=1
        break
      fi
      d_spec="${spec%%:*}"
      v_spec="${spec#*:}"
      if [[ ${d_spec} == "*" || ${d_spec} == "${os_id}" ]]; then
        if [[ ${v_spec} == "*" || ${v_spec} == "${os_codename}" || (-n ${os_ver} && ${v_spec} == "${os_ver}") ]]; then
          matched=1
          break
        fi
      fi
    done
    ((matched == 1))
    return $?
  fi

  for spec in "${incompat[@]}"; do
    [[ ${spec} == *:* ]] || continue
    if [[ -n ${current_tag} && ${spec} == "${current_tag}" ]]; then
      return 1
    fi
    d_spec="${spec%%:*}"
    v_spec="${spec#*:}"
    if [[ ${d_spec} == "*" || ${d_spec} == "${os_id}" ]]; then
      if [[ ${v_spec} == "*" || ${v_spec} == "${os_codename}" || (-n ${os_ver} && ${v_spec} == "${os_ver}") ]]; then
        return 1
      fi
    fi
  done
  return 0
}

main() {
  if [[ ${1:-} == "--check-current" ]]; then
    shift
    check_current_os "${1:?Missing pacscript path}"
    return $?
  fi

  local table
  table="$(build_distro_table)"

  local -a input_files=()
  local arg item
  for arg in "$@"; do
    for item in ${arg}; do
      [[ -n ${item} ]] && input_files+=("${item}")
    done
  done

  local -a selected=()
  local rel pkg_dir srcinfo tag
  for rel in "${input_files[@]+"${input_files[@]}"}"; do
    [[ ${rel} == *.pacscript ]] || continue
    pkg_dir="$(dirname "${rel}")"
    srcinfo="${pkg_dir}/.SRCINFO"
    if [[ ! -f ${srcinfo} ]]; then
      echo "Error: missing .SRCINFO for ${rel}" >&2
      return 1
    fi

    local -a compat=() incompat=() pkg_tags=()
    mapfile -t compat < <(awk -F ' = ' '/^[ \t]*compatible = / {v=tolower($2); gsub(/^[ \t]+|[ \t]+$/, "", v); if (v!="" && !seen[v]++) print v}' "${srcinfo}")
    mapfile -t incompat < <(awk -F ' = ' '/^[ \t]*incompatible = / {v=tolower($2); gsub(/^[ \t]+|[ \t]+$/, "", v); if (v!="" && !seen[v]++) print v}' "${srcinfo}")

    if ((${#compat[@]} > 0 && ${#incompat[@]} > 0)); then
      echo "Error: ${rel} defines both compatible and incompatible" >&2
      return 1
    elif ((${#compat[@]} > 0)); then
      mapfile -t pkg_tags < <(expand_compatible "${table}" "${compat[@]}")
    elif ((${#incompat[@]} > 0)); then
      mapfile -t pkg_tags < <(filter_incompatible "${table}" "${incompat[@]}")
    else
      pkg_tags=("${DEFAULT_OS[@]}")
    fi

    for tag in "${pkg_tags[@]}"; do
      add_unique selected "${tag}"
    done
  done

  if ((${#selected[@]} == 0)); then
    echo "[]"
  else
    printf '%s\n' "${selected[@]}" | jq -R . | jq -cs .
  fi
}

main "$@"
