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
# @file srcinfo.sh
# @brief A library for parsing SRCINFO into native bash dictionaries.
# @description
#   This library is used for parsing SRCINFO into native bash dictionaries.
#   Since Bash as of now does not have multidimensional arrays, srcinfo_bash
#   takes a lot of liberties with creating arrays, and tries its hardest to make
#   them easy to access.
#
# @credits
#   Based on Elsie19's srcinfo_bash
#     https://github.com/Elsie19/srcinfo_bash
#
#   Based on makepkg's pkgbuild.sh
#     Copyright (C) 2009-2024 Pacman Development Team
#     <pacman-dev@lists.archlinux.org>

function srcinfo.is_array() {
  [[ ${!1@a} == *a* ]]
}

function srcinfo.die() {
  printf >&2 '[\033[1;31mERROR\033[0m]: %s\n' "$@"
  exit 1
}

function srcinfo.extr_globvar() {
  local attr="${1}" isarray="${2}" outputvar="${3}"
  if ((isarray)); then
    local -n ref="${attr}" out="${outputvar}"
    [[ -v ref ]] && out=("${ref[@]}")
  else
    [[ -v ${attr} && -n ${!attr} ]] && printf -v "${outputvar}" %s "${!attr}"
  fi
}

function srcinfo.extr_fnvar() {
  local funcname="${1}" attr="${2}" isarray="${3}" outputvar="${4}"
  local attr_regex decl r=1
  if ((isarray)); then
    printf -v attr_regex '[[:space:]]* %s\+?=\(' "${attr}"
  else
    printf -v attr_regex '[[:space:]]* %s\+?=[^(]' "${attr}"
  fi
  local func_body
  mapfile -t func_body < <(declare -f "${funcname}" 2> /dev/null)
  [[ -z ${func_body[*]} || ! ${func_body[*]} =~ ${attr_regex} ]] && return 1
  for line in "${func_body[@]}"; do
    [[ ${line} =~ ^${attr_regex} ]] || continue
    decl=${line##*([[:space:]])}
    eval "${decl/#${attr}/${outputvar}}"
    r=0
    break
  done
  return "${r}"
}

function srcinfo.get_attr() {
  local pkgname="${1}" attrname="${2}" isarray="${3}" outputvar="${4}"
  if ((isarray)); then
    eval "${outputvar}=()"
  else
    printf -v "${outputvar}" %s ''
  fi
  if [[ -n ${pkgname} ]]; then
    srcinfo.extr_globvar "${attrname}" "${isarray}" "${outputvar}"
    srcinfo.extr_fnvar "package_${pkgname}" "${attrname}" "${isarray}" "${outputvar}"
  else
    srcinfo.extr_globvar "${attrname}" "${isarray}" "${outputvar}"
  fi
}

function srcinfo.write_attr() {
  local attrname="${1}" attrvalues=("${@:2}")
  attrvalues=("${attrvalues[@]//+([[:space:]])/ }")
  attrvalues=("${attrvalues[@]#[[:space:]]}")
  attrvalues=("${attrvalues[@]%[[:space:]]}")
  printf "\t${attrname} = %s\n" "${attrvalues[@]}"
}

function srcinfo.extract() {
  local pkgname="${1}" attrname="${2}" isarray="${3}" outvalue
  if srcinfo.get_attr "${pkgname}" "${attrname}" "${isarray}" 'outvalue'; then
    srcinfo.write_attr "${attrname}" "${outvalue[@]}"
  fi
}

function srcinfo.write_details() {
  local attr a
  for attr in "${singlevalued[@]}"; do
    srcinfo.extract "$1" "${attr}" 0
  done

  for attr in "${multivalued[@]}"; do
    srcinfo.extract "$1" "${attr}" 1
  done
  for a in "${arch[@]}"; do
    [[ ${a} == any || ${a} == all ]] && continue

    for attr in "${multivalued_arch_attrs[@]}"; do
      srcinfo.extract "$1" "${attr}_${a}" 1
    done
  done
}

function srcinfo.vars() {
  local _distros _vars _archs _sums distros \
    vars="gives depends makedepends optdepends pacdeps checkdepends provides conflicts breaks replaces enhances recommends suggests makeconflicts checkconflicts source" \
    sums="b2 sha512 sha384 sha256 sha224 sha1 md5"
  allvars=(pkgname gives pkgver pkgrel epoch pkgdesc url priority)
  allars=(arch depends makedepends checkdepends optdepends pacdeps conflicts makeconflicts checkconflicts breaks replaces provides enhances recommends suggests incompatible compatible backup mask noextract nosubmodules license maintainer repology custom_fields source)
  distros=$(awk '{sub(/\/.*/, "", $1); gsub(/:$/, "", $1); distros=distros $1 " "} END {sub(/ $/, "", distros); print distros}' distrolist)
  _distros="{${distros// /,}}" _vars="{${vars// /,}}" _sums="{${sums// /,}}"
  eval "allars+=(${_sums}sums ${_vars}_${_distros} ${_sums}sums_${_distros})"
  eval "allvars+=(gives_${_distros})"
  eval "multivalued_arch_attrs=(${vars} ${_sums}sums ${_vars}_${_distros} ${_sums}sums_${_distros})"
  multilist=("${multivalued_arch_attrs[@]}")
  mapfile -t -O "${#multilist[@]}" multilist < <(
    for i in {amd64,x86_64,arm64,aarch64,armel,arm,armhf,armv7h,i386,i686,ppc64el,riscv64,s390x}; do
      printf "%s_${i}\n" "${multivalued_arch_attrs[@]}"
    done
  )
  export multilist
}

function srcinfo.write_global() {
  unset "${allvars[@]}" "${allars[@]}"
  local CARCH='CARCH_REPLACE' DISTRO='DISTROBASE:DISTROVER' CDISTRO='CDISTROBASE:CDISTROVER' AARCH='AARCH_REPLACE' var ar aars bar ars rar rep seek alt
  local -A AARCHS_MAP=(
    ["amd64"]="x86_64"
    ["arm64"]="aarch64"
    ["armel"]="arm"
    ["armhf"]="armv7h"
    ["i386"]="i686"
    ["ppc64el"]="ppc64el"
    ["riscv64"]="riscv64"
    ["s390x"]="s390x"
  )
  local -A CARCHS_MAP=(
    ["x86_64"]="amd64"
    ["aarch64"]="arm64"
    ["arm"]="armel"
    ["armv7h"]="armhf"
    ["i686"]="i386"
    ["ppc64el"]="ppc64el"
    ["riscv64"]="riscv64"
    ["s390x"]="s390x"
  )
  # shellcheck disable=SC1090
  source "${1}"
  [[ " ${arch[*]} " != *" all "* && " ${arch[*]} " != *" any "* ]] \
    && for ar in "${multilist[@]}"; do
      local -n bar="${ar}"
      [[ -z ${bar[*]} || ! ${bar[*]} =~ ARCH_REPLACE ]] && continue
      for ars in "${bar[@]}"; do
        ars="${ars//+([[:space:]])/ }"
        ars="${ars#[[:space:]]}"
        ars="${ars%[[:space:]]}"
        for aars in "${arch[@]}"; do
          if [[ ${ars} =~ AARCH_REPLACE ]]; then
            seek="AARCH_REPLACE"
            rep="${AARCHS_MAP[${aars}]:-${aars}}"
            alt="${CARCHS_MAP[${aars}]:-${aars}}"
          else
            seek="CARCH_REPLACE"
            rep="${CARCHS_MAP[${aars}]:-${aars}}"
            alt="${AARCHS_MAP[${aars}]:-${aars}}"
          fi
          local -n fin="${ar}_${rep}" fan="${ar}_${alt}" fun="${ar}"
          if [[ ${ars} =~ ARCH_REPLACE ]]; then
            # shellcheck disable=SC2076
            if [[ " ${AARCHS_MAP[*]} " =~ " ${ar##*_} " || " ${!AARCHS_MAP[*]} " =~ " ${ar##*_} " || ${ar} == *"x86_64" ]]; then
              : "${ar}+=(${ars//${seek}/${rep}})"
              [[ ${ar} != *"${aars}" ]] && continue
            else
              : "${ar}_${aars}+=(${ars//${seek}/${rep}})"
            fi
            if [[ -z ${fin[*]} && -z ${fan[*]} || " ${fin[*]} " == *" ${ars//${rep}/${seek}} "* ]]; then
              eval "${_//+=/=}"
            elif [[ " ${fun[*]} " != *" ${ars//${aars}/${alt}} "* && " ${fan[*]} " != *" ${ars//${aars}/${alt}} "* ]]; then
              eval "${_}"
            fi
          else
            # shellcheck disable=SC2076
            if [[ " ${AARCHS_MAP[*]} " =~ " ${ar##*_} " || " ${!AARCHS_MAP[*]} " =~ " ${ar##*_} " || ${ar} == *"x86_64" ]]; then
              eval "${ar}+=(${ars})"
            else
              eval "${ar}_${aars}+=(${ars})"
            fi
          fi
        done
        # shellcheck disable=SC2076
        if [[ " ${multivalued_arch_attrs[*]} " =~ " ${ar} " ]]; then
          unset "${ar}"
        fi
      done
    done
  local singlevalued=("${allvars[@]}")
  local multivalued=("${allars[@]}")
  printf '%s = %s\n' 'pkgbase' "${pkgbase:-${pkgname}}"
  srcinfo.write_details ''
}

function srcinfo.write_package() {
  local singlevalued=(gives pkgdesc url priority)
  local multivalued=(arch license depends checkdepends optdepends pacdeps
    provides checkconflicts conflicts breaks replaces enhances recommends suggests backup repology)
  srcinfo.write_details "$1"
}

function srcinfo.gen() {
  local pkg
  srcinfo.write_global "${1}"
  for pkg in "${pkgname[@]}"; do
    printf '\n%s = %s\n' 'pkgname' "${pkg}"
    ((${#pkgname[@]} > 1)) && srcinfo.write_package "${pkg}"
  done
}

function srcinfo.write_out() {
  (($# <= 0)) && srcinfo.die "You failed to specify a pacscript"
  # shellcheck disable=SC2064
  trap "$(shopt -p extglob)" RETURN
  shopt -s extglob
  srcinfo.vars
  for i in "${@}"; do
    [[ -f ${i} && -w ${i} ]] || srcinfo.die "Not a file: ${i}"
    srcinfo.gen "${i}" > "${i%/*.pacscript}"/.SRCINFO &
  done
  wait
}

# @description Split a key value pair into an associated array.
#
# @example
#   declare -A out
#   srcinfo.parse_key_val 'foo = bar' out
#
# @arg $1 string Key value assignment
# @arg $2 string Name of associated array
function srcinfo.parse_key_val() {
  local key value input="${1}"
  declare -n out_array="${2}"
  key="${input%%=*}"
  value="${input#*=}"
  key="${key#"${key%%[![:space:]]*}"}"
  key="${key%"${key##*[![:space:]]}"}"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  # shellcheck disable=SC2034
  out_array=([key]="${key}" [value]="${value}")
}

function srcinfo._basic_check() {
  [[ ${1} == *"="* ]]
}

function srcinfo._contains() {
  local -n arr_name="${1}"
  local key="${2}" z
  for z in "${arr_name[@]}"; do
    if [[ ${z} == "${key}" ]]; then
      return 0
    fi
  done
  return 1
}

# @description Create array based on input
#
# @example
#   srcinfo._create_array base var_name
#
# @arg $1 string The pkgbase of the section
# @arg $2 string The variable name
#
# @stdout Name of array created.
function srcinfo._create_array() {
  local base="${1}" var_name="${2}"
  base="${base//./_}" var_name="${var_name//./_}"
  if ! [[ -v "srcinfo_${base}_array_${var_name}" ]]; then
    declare -ag "srcinfo_${base}_array_${var_name}"
  fi
  echo "srcinfo_${base}_array_${var_name}"
}

function srcinfo.parse() {
  # We need this for trimming whitespace without external tools.
  # shellcheck disable=SC2064
  trap "$(shopt -p extglob)" RETURN
  shopt -s extglob
  srcinfo.cleanup
  local srcfile locbase temp_array ref total_list loop part i suffix
  srcfile="${1:?No .SRCINFO passed to srcinfo.parse}"
  [[ ! -s ${srcfile} ]] && return 5
  mapfile -t srcinfo_data < "${srcfile}"
  for line in "${srcinfo_data[@]}"; do
    # Skip blank lines
    [[ -z ${line} || ${line} =~ ^\s*#.* ]] && continue
    # Trim leading whitespace.
    line="${line##+([[:space:]])}"
    declare -A temp_line
    if ! srcinfo._basic_check "${line}"; then
      echo "Could not parse line: '${line}'" >&2
      return 3
    fi
    srcinfo.parse_key_val "${line}" temp_line
    if [[ -z ${temp_line[value]} ]]; then
      echo "Empty value for: '${line}'" >&2
      return 4
    fi
    # Define pkgbase first, it must be the first thing listed
    if [[ -z ${globase} ]]; then
      # Do we have pkgbase first?
      if [[ ${temp_line[key]} == "pkgbase" ]]; then
        locbase="pkgbase_${temp_line[value]//-/_}"
        globase="${temp_line[value]//./_}"
      else
        locbase="${temp_line[value]//-/_}"
        globase="temporary_pacstall_pkgbase"
      fi
    elif [[ ${temp_line[key]} == *"pkgname" ]]; then
      # Bash can't have dashes in variable names
      locbase="${temp_line[value]//-/_}"
    fi
    # Next we need to parse out individual keys.
    # So the strategy is to create arrays of every key and at the end,
    # we can promote array.len() == 1 to variables instead. After that we
    # can work back upwards.
    temp_array="$(srcinfo._create_array "${locbase}" "${temp_line[key]}" "srcinfo")"
    declare -n ref="${temp_array}"
    ref+=("${temp_line[value]}")
    if ! srcinfo._contains total_list "${temp_array}"; then
      total_list+=("${temp_array}")
    fi
  done
  unset srcinfo_data
  declare -Ag "srcinfo_access"
  for loop in "${total_list[@]}"; do
    declare -n part="${loop}"
    # Are we at a new pkgname (pkgbase)?
    if [[ ${loop} == *@(pkgname|pkgbase) ]]; then
      declare -n var_name="srcinfo_access"
      [[ ${loop} == "srcinfo_pkgbase"* ]] && global="pkgbase_"
      for i in "${!part[@]}"; do
        suffix="${global}${part[${i}]//-/_}"
        suffix="${suffix//./_}"
        # Create our inner part
        declare -ga "srcinfo_${suffix}"
        # Declare that relationship
        var_name["srcinfo_${suffix}"]="srcinfo_${suffix}"
      done
      unset global
    fi
  done
}

function srcinfo.cleanup() {
  local compg
  mapfile -t compg < <(compgen -v "srcinfo_")
  unset "${compg[@]}" srcinfo_access globase global 2> /dev/null
}

# @description Output a specific variable from .SRCINFO
#
# @example
#
#   srcinfo.match_pkg .SRCINFO pkgbase
#   srcinfo.match_pkg .SRCINFO pkgdesc $(srcinfo.match_pkg .SRCINFO pkgbase)
# @arg $1 string .SRCINFO file path
# @arg $2 string Variable or Array to search
# @arg $3 string Package name or base to get output for
function srcinfo.match_pkg() {
  local srcinfo_file="${1}" search="${2}" pkg="${3}" pkgbase output var
  local -n bases="srcinfo_access"
  pkg="${pkg//./_}"
  pkg="${pkg//:/_}"
  pkg="${pkg//-/_}"
  srcinfo.parse "${srcinfo_file}"
  for var in "${bases[@]}"; do
    var="${var//./_}"
    declare -n output="${var}_array_${search}"
    if [[ -n ${output[*]} ]]; then
      if [[ ${search} == "pkgbase" ]]; then
        echo "pkgbase:${output[0]}"
      elif [[ ${search} == "pkgname" || ${var}_array_${search} == "srcinfo_${pkg}_array_${search}" ]]; then
        printf '%s\n' "${output[@]}"
      fi
    fi
  done
}

function srcinfo.pkg_list() {
  local origname outlist inlist pkgnames
  mapfile -t inlist < <(ls -1 packages)
  for i in "${inlist[@]}"; do
    if awk 'BEGIN { found = 0 } /^pkgbase=/ { found = 1; exit } END { exit !found }' "packages/${i}/${i}.pacscript"; then
      mapfile -t pkgnames < <(srcinfo.match_pkg packages/"${i}"/.SRCINFO pkgname)
      outlist+=("${i}:pkgbase")
      for j in "${pkgnames[@]}"; do
        outlist+=("${i}:${j}")
      done
    else
      outlist+=("${i}")
    fi
  done
  printf '%s\n' "${outlist[@]}"
}

function srcinfo.repo_check() {
  local tracked repolist ret
  mapfile -t tracked < <(git ls-files)
  if ((${#@} < 1)); then
    mapfile -t repolist < <(ls packages/*/*.pacscript)
  else
    repolist=("${@}")
  fi
  ret=0
  for i in "${repolist[@]}"; do
    if ! [[ -f "${i%/*.pacscript}/.SRCINFO" ]]; then
      printf '[\033[1;31mERR\033[0m]: no .SRCINFO found for %s\n' "${i##*/}"
      printf '  [\033[1;34m>\033[0m]: run \033[1;37m./scripts/srcinfo.sh %s\033[0m\n' "${i}"
      printf '  [\033[1;34m>\033[0m]: after, run \033[1;37mgit add %s\033[0m\n\n' "${i%/*.pacscript}/.SRCINFO"
      ret=1
    elif ! srcinfo._contains tracked "${i%/*.pacscript}/.SRCINFO"; then
      printf '[\033[1;31mERR\033[0m]: no .SRCINFO tracked by git for %s\n' "${i##*/}"
      printf '  [\033[1;34m>\033[0m]: run \033[1;37mgit add %s\033[0m\n\n' "${i%/*.pacscript}/.SRCINFO"
      ret=1
    fi
  done
  return "${ret}"
}

function srcinfo.list_build() {
  local FILE="${1}" filelist
  mapfile -t filelist < <(ls packages/*/.SRCINFO)
  {
    printf "### Auto-generated for pacstall-programs\n### DO NOT EDIT. Use scripts/srcinfo.sh to build.\n"
    for i in "${filelist[@]}"; do
      echo "---"
      while IFS= read -r line; do
        echo "${line}"
      done < "${i}"
    done
  } > "${FILE}"
}

function srcinfo.list_search() {
  local FILE="${1}"
  awk -v kw="${2}" '
  BEGIN {
    FS = "[[:space:]]*=[[:space:]]*"
    OFS = " - "
    found = 0
    kw = tolower(kw)
  }
  function print_pkgbase_and_pkgname() {
    if (pkgbase != "") {
      print pkgbase, pkgbase_desc
      for (i in pkgnames) {
        desc = (pkgname_descs[i] != "" ? pkgname_descs[i] : pkgbase_desc)
        print pkgbase ":" pkgnames[i], desc
      }
    }
  }
  /^---$/ {
    if (pkgbase != "") {
      if (pkgbase ~ kw || tolower(pkgbase_desc) ~ kw || kw == "") {
        print_pkgbase_and_pkgname()
        found = 1
      } else {
        for (i in pkgnames) {
          desc = (pkgname_descs[i] != "" ? pkgname_descs[i] : pkgbase_desc)
          if (pkgnames[i] ~ kw || tolower(desc) ~ kw) {
            print pkgbase ":" pkgnames[i], desc
            found = 1
          }
        }
      }
    }
    pkgbase = ""; pkgbase_desc = ""; delete pkgnames; delete pkgname_descs
    next
  }
  /^[[:space:]]*pkgbase[[:space:]]*=/ {
    pkgbase = $2
    pkgbase_desc = ""
  }
  /^[[:space:]]*pkgname[[:space:]]*=/ {
    # Add pkgname to array
    pkgnames[length(pkgnames) + 1] = $2
    pkgname_descs[length(pkgnames)] = ""
  }
  /^[[:space:]]*pkgdesc[[:space:]]*=/ {
    if (length(pkgnames) == 0) {
      pkgbase_desc = $2
    } else {
      pkgname_descs[length(pkgnames)] = $2
    }
  }
  END {
    if (pkgbase != "") {
      print_pkgbase_and_pkgname()
    }
    if (!found) {
      print "No matching packages found"
    }
  }
  ' "${FILE}"
}

function srcinfo.list_parse() {
  local SRCFILE="${1}" PKGFILE="${2}" KWD="${3}" SEARCH CHILD searchlist pkglist foundname exact=false
  SEARCH="${KWD%% *}"
  if [[ ${KWD} == \'*\' ]]; then
    exact=true
    KWD="${KWD%*\'}"
    KWD="${KWD#\'*}"
  elif [[ ${KWD} == \"*\" ]]; then
    exact=true
    KWD="${KWD%*\"}"
    KWD="${KWD#\"*}"
  else
    KWD="${KWD,,}"
  fi
  if [[ ${SEARCH} == *':'* && ${SEARCH} == "${KWD##* }" ]]; then
    CHILD="${SEARCH#*:}" KWD="${SEARCH%:*}"
  fi
  mapfile -t searchlist < <(srcinfo.list_search "${1}" "${KWD}")
  mapfile -t pkglist < "${PKGFILE}"
  for i in "${searchlist[@]}"; do
    foundname="${i%% -*}"
    if [[ -n ${CHILD} && ${CHILD} != "pkgbase" && ${foundname} != "${KWD}:${CHILD}" ]] \
      || [[ ${CHILD} == "pkgbase" && ${foundname} =~ ':' && ${foundname} != *":${CHILD}" ]] \
      || [[ ${exact} == true && ${i} != *"${KWD}"* ]] \
      || [[ ${exact} == false && -n ${KWD} && ${i,,} != *"${KWD}"* ]]; then
      continue
    fi
    if srcinfo._contains pkglist "${foundname}"; then
      printf '\033[0;35m%s\033[0m - %s\n' "${foundname}" "${i#* - }"
    elif srcinfo._contains pkglist "${foundname}:pkgbase"; then
      printf '\033[0;35m%s:pkgbase\033[0m - %s\n' "${foundname}" "${i#* - }"
    fi
  done
}

function srcinfo.list_info() {
  local FILE="${1}" SEARCH="${2}" NAME FIELD
  NAME="${SEARCH#*:}" PARENT="${SEARCH%:*}"
  if [[ ${SEARCH} != *':'* || ${NAME} == "pkgbase" ]]; then
    FIELD="pkgbase"
  else
    FIELD="pkgname"
  fi
  [[ ${NAME} == "pkgbase" ]] && NAME="${PARENT}"
  awk -v pkg="${NAME}" -v field="${FIELD}" '
  BEGIN { print_pkg = 0 }
  /^[[:space:]]*$/ || /^---$/ {
    if (print_pkg && field == "pkgname") {
      exit
    }
  }
  /^---$/ {
    print_pkg = 0
  }
  {
    if ($1 == "pkgbase" && $3 != pkg && field == "pkgname") {
      print_pkg = 0
    }
    if ($1 == field && $3 == pkg) {
      print_pkg = 1
    }
    if (print_pkg) {
      print
    }
  }
  ' "${FILE}"
}

function srcinfo.head_only() {
  if ! [[ -d "packages" && -d "scripts" && -f "distrolist" ]]; then
    srcinfo.die "This command can only be run from the head of a repository"
  fi
}

function srcinfo.cmd() {
  export GREEN=$'\033[0;32m' NC=$'\033[0m'
  case "${1}" in
    write)
      [[ ! -f "distrolist" ]] && srcinfo.die "distrolist file required to generate .SRCINFO"
      shift 1
      # list of packages to write to
      ((${#@} < 1)) && srcinfo.die "Usage: ${GREEN}write${NC} {<path/to/1.pacscript> <path/to/2.pacscript>...}"
      srcinfo.write_out "${@}"
      ;;
    check)
      shift 1
      # check if .SRCINFOs exist
      ((${#@} < 1)) && srcinfo.die "Usage: ${GREEN}check${NC} {<path/to/1.pacscript> <path/to/2.pacscript>...}"
      srcinfo.repo_check "${@}"
      ;;
    read)
      [[ -z ${3} || ${2} == *".pacscript" ]] && srcinfo.die "Usage: ${GREEN}read${NC} <path/to/.SRCINFO> {pkgbase | pkgname | <variable> [<package> | pkgbase:<package>]}"
      # shellcheck disable=SC2086
      srcinfo.match_pkg "${2}" "${3}" ${4}
      ;;
    add)
      srcinfo.head_only
      shift 1
      # check if .SRCINFOs exist
      ((${#@} < 1)) && srcinfo.die "Usage: ${GREEN}add${NC} {<package1> <package2>...}"
      local allin
      for i in "${@}"; do
        allin+=("packages/${i}/${i}.pacscript")
      done
      srcinfo.write_out "${allin[@]}" \
        && srcinfo.repo_check "${allin[@]}" \
        && srcinfo.pkg_list > "packagelist" \
        && srcinfo.list_build "srclist"
      ;;
    build)
      srcinfo.head_only
      case "${2}" in
        packagelist)
          srcinfo.pkg_list > "packagelist"
          ;;
        srclist)
          srcinfo.list_build "srclist"
          ;;
        all)
          srcinfo.pkg_list > "packagelist"
          srcinfo.list_build "srclist"
          ;;
        *)
          srcinfo.die "Usage: ${GREEN}build${NC} {packagelist | srclist | all}"
          ;;
      esac
      ;;
    search)
      srcinfo.head_only
      [[ -z ${2} ]] && srcinfo.die "Usage: ${GREEN}search${NC} {<package> | <pkgbase>:<pkgname> | <keyword> | <'keyword string'>}"
      [[ ! -f "packagelist" ]] && srcinfo.pkg_list > "packagelist"
      [[ ! -f "srclist" ]] && srcinfo.list_build "srclist"
      srcinfo.list_parse "srclist" "packagelist" "${2}"
      ;;
    info)
      srcinfo.head_only
      [[ -z ${2} ]] && srcinfo.die "Usage: ${GREEN}info${NC} {<package> | <pkgbase>:<pkgname>}"
      [[ ! -f "srclist" ]] && srcinfo.list_build "srclist"
      srcinfo.list_info "srclist" "${2}"
      ;;
    help)
      local all_cmds=("add" "search" "info" "build" "read" "write" "check") option usage
      case "${2}" in
        add)
          usage="{<package1> <package2>...}"
          purpose="Generate .SRCINFOs, check their statuses, and update the packagelist + srclist"
          ;;
        search)
          usage="{<package> | <pkgbase>:<pkgname> | <keyword> | <'keyword string'>}"
          purpose="Search for matching packages and descriptions from the srclist file"
          ;;
        info)
          usage="{<package> | <pkgbase>:<pkgname>}"
          purpose="Parse a package or child .SRCINFO from the srclist file"
          ;;
        build)
          usage="{packagelist | srclist | all}"
          purpose="Update the packagelist and/or srclist"
          ;;
        read)
          usage="<path/to/.SRCINFO> {pkgbase | pkgname | <variable> [<package> | pkgbase:<package>]}"
          purpose="Parse variables and arrays from a .SRCINFO file"
          ;;
        write)
          usage="{<path/to/1.pacscript> <path/to/2.pacscript>...}"
          purpose="Generate .SRCINFOs for pacscripts"
          ;;
        check)
          usage="{<path/to/1.pacscript> <path/to/2.pacscript>...}"
          purpose="Check the git status of .SRCINFOs for pacscripts"
          ;;
        all)
          for i in "${all_cmds[@]}"; do
            ${0} help "${i}"
          done
          exit 0
          ;;
        *)
          usage="{add | search | info | build | read | write | check | help [all | <cmd>]}"
          purpose="Help maintainers and repo owners easily manage package data generation"
          ;;
      esac
      if srcinfo._contains all_cmds "${2}"; then
        option="${2}"
      else
        option="${0}"
      fi
      printf '[\033[0;33mHELP\033[0m] Command: \033[0;32m%s\033[0m\n' "${option}"
      printf '   [\033[1;33m?\033[0m] \033[0;32mUsage\033[0m: %s %s\n' "${option}" "${usage}"
      printf '   [\033[1;33m?\033[0m] \033[0;32mPurpose\033[0m: %s\n' "${purpose}"
      ;;
    *)
      srcinfo.die "Usage: ${GREEN}${0}${NC} {add | search | info | build | read | write | check | help}"
      ;;
  esac
}

srcinfo.cmd "${@}"
# vim:set ft=sh ts=2 sw=4 noet:
