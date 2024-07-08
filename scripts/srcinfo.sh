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
  printf >&2 'ERROR: %s\n' "$@"
  exit 1
}

function srcinfo.array_build() {
  local dest="${1}" src="${2}" i keys values
  declare -p "$2" &> /dev/null || return 1
  eval "keys=(\"\${!$2[@]}\")"
  eval "${dest}=()"
  for i in "${keys[@]}"; do
    values+=("printf -v '${dest}[${i}]' %s \"\${${src}[${i}]}\";")
  done
  eval "${values[*]}"
}

function srcinfo.extr_globvar() {
  local attr="${1}" isarray="${2}" outputvar="${3}" ref
  if ((isarray)); then
    srcinfo.array_build ref "${attr}"
    ((${#ref[@]})) && srcinfo.array_build "${outputvar}" "${attr}"
  else
    [[ -n ${!attr} ]] && printf -v "${outputvar}" %s "${!attr}"
  fi
}

function srcinfo.extr_fnvar() {
  local funcname="${1}" attr="${2}" isarray="${3}" outputvar="${4}"
  local attr_regex decl r=1
  if ((isarray)); then
    printf -v attr_regex '^[[:space:]]* %s\+?=\(' "${attr}"
  else
    printf -v attr_regex '^[[:space:]]* %s\+?=[^(]' "${attr}"
  fi
  local func_body
  func_body=$(declare -f "${funcname}" 2> /dev/null)
  [[ -z ${func_body} ]] && return 1
  IFS=$'\n' read -r -d '' -a lines <<< "${func_body}"
  for line in "${lines[@]}"; do
    [[ ${line} =~ ${attr_regex} ]] || continue
    decl=${line##*([[:space:]])}
    eval "${decl/#${attr}/${outputvar}}"
    r=0
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
  local attr package_arch a
  for attr in "${singlevalued[@]}"; do
    srcinfo.extract "$1" "${attr}" 0
  done

  for attr in "${multivalued[@]}"; do
    srcinfo.extract "$1" "${attr}" 1
  done

  srcinfo.get_attr "$1" 'arch' 1 'package_arch' || package_arch=("all")
  for a in "${package_arch[@]}"; do
    [[ ${a} == any || ${a} == all ]] && continue

    for attr in "${multivalued_arch_attrs[@]}"; do
      srcinfo.extract "$1" "${attr}_${a}" 1
    done
  done
}

function srcinfo.vars() {
  local _distros _vars _archs _sums distros \
    vars="depends makedepends optdepends pacdeps checkdepends provides conflicts breaks replaces enhances recommends makeconflicts checkconflicts source" \
    sums="b2 sha512 sha384 sha256 sha224 sha1 md5"
  allvars=(pkgname gives pkgver pkgrel epoch pkgdesc url priority)
  allars=(arch depends makedepends checkdepends optdepends pacdeps conflicts makeconflicts checkconflicts breaks replaces provides enhances recommends incompatible compatible backup mask noextract nosubmodules license maintainer repology custom_fields source)
  distros=$(awk '{sub(/\/.*/, "", $1); gsub(/:$/, "", $1); distros=distros $1 " "} END {sub(/ $/, "", distros); print distros}' distrolist)
  _distros="{${distros// /,}}" _vars="{${vars// /,}}" _sums="{${sums// /,}}"
  eval "allars+=(${_sums}sums ${_vars}_${_distros} ${_sums}sums_${_distros})"
  eval "allvars+=(gives_${_distros})"
  eval "multivalued_arch_attrs=(${vars} ${_sums}sums ${_vars}_${_distros} ${_sums}sums_${_distros})"
}

function srcinfo.write_global() {
  unset "${allvars[@]}" "${allars[@]}"
  local CARCH='CARCH_REPLACE' DISTRO='DISTROBASE:DISTROVER' CDISTRO='CDISTROBASE:CDISTROVER' AARCH='AARCH_REPLACE' var ar aars bar ars rar rep seek
  local -A AARCHS_MAP=(
    ["amd64"]="x86_64"
    ["arm64"]="aarch64"
    ["armel"]="arm"
    ["armhf"]="armv7h"
    ["i386"]="i686"
    ["mips64el"]="mips64el"
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
    ["mips64el"]="mips64el"
    ["ppc64el"]="ppc64el"
    ["riscv64"]="riscv64"
    ["s390x"]="s390x"
  )
  # shellcheck disable=SC1090
  source "${1}"
  for ar in "${allars[@]}"; do
    [[ ${ar} != "arch" ]] \
      && local -n bar="${ar}"
    if [[ -n ${bar[*]} ]]; then
      for ars in "${bar[@]}"; do
        ars="${ars//+([[:space:]])/ }"
        ars="${ars#[[:space:]]}"
        ars="${ars%[[:space:]]}"
        if [[ ${ars} =~ CARCH_REPLACE || ${ars} =~ AARCH_REPLACE ]]; then
          [[ -z ${arch[*]} ]] && arch=('amd64')
          for aars in "${arch[@]}"; do
            if [[ ${ars} =~ AARCH_REPLACE ]]; then
              seek="AARCH_REPLACE"
              if [[ " ${AARCHS_MAP[*]} " =~ ${aars} ]]; then
                rep="${aars}"
              else
                rep="${AARCHS_MAP[${aars}]}"
              fi
            else
              seek="CARCH_REPLACE"
              if [[ " ${AARCHS_MAP[*]} " =~ ${aars} ]]; then
                rep="${CARCHS_MAP[${aars}]}"
              else
                rep="${aars}"
              fi
            fi
            # shellcheck disable=SC2076
            if [[ " ${AARCHS_MAP[*]} " =~ " ${ar##*_} " || " ${!AARCHS_MAP[*]} " =~ " ${ar##*_} " || ${ar} == *"x86_64" ]]; then
              : "${ar}=${ars}"
              [[ ${ar} != *"${aars}" ]] && continue
            else
              : "${ar}_${aars}=${ars}"
            fi
            eval "${_//${seek}/${rep}}"
          done
          unset "${ar}"
        fi
      done
    fi
  done
  local singlevalued=("${allvars[@]}")
  local multivalued=("${allars[@]}")
  printf '%s = %s\n' 'pkgbase' "${pkgbase:-${pkgname}}"
  srcinfo.write_details ''
}

function srcinfo.write_package() {
  local singlevalued=(gives pkgdesc url priority)
  local multivalued=(arch license depends checkdepends optdepends pacdeps
    provides checkconflicts conflicts breaks replaces enhances recommends backup repology)
  printf '%s = %s\n' 'pkgname' "$1"
  srcinfo.write_details "$1"
}

function srcinfo.gen() {
  local pkg
  srcinfo.write_global "${1}"
  for pkg in "${pkgname[@]}"; do
    echo
    srcinfo.write_package "${pkg}"
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
#   srcinfo._create_array pkgbase var_name var_prefix
#
# @arg $1 string (optional) The pkgbase of the section
# @arg $2 string The variable name
# @arg $3 string (optional) The variable prefix
#
# @stdout Name of array created.
function srcinfo._create_array() {
  local pkgbase="${1}" var_name="${2}" var_pref="${3}"
  if [[ -n ${pkgbase} ]]; then
    if ! [[ -v "${var_pref}_${pkgbase}_array_${var_name}" ]]; then
      declare -ag "${var_pref}_${pkgbase}_array_${var_name}"
    fi
    echo "${var_pref}_${pkgbase}_array_${var_name}"
  else
    if ! [[ -v "${var_pref}_array_${var_name}" ]]; then
      declare -ag "${var_pref}_array_${var_name}"
    fi
    echo "${var_pref}_array_${var_name}"
  fi
}

# @description Promote array to variable
#
# @example
#   foo=('bar')
#   srcinfo._promote_to_variable foo
#
# @arg $1 string Name of array to promote
function srcinfo._promote_to_variable() {
  local var_name="${1}" key value
  key="${var_name}"
  value="${!var_name[0]}"
  declare -g "${key}=${value}"
}

function srcinfo.parse() {
  # We need this for trimming whitespace without external tools.
  # shellcheck disable=SC2064
  trap "$(shopt -p extglob)" RETURN
  shopt -s extglob
  local srcinfo_file var_prefix locbase temp_array ref total_list loop part i part_two split_up
  srcinfo_file="${1:?No .SRCINFO passed to srcinfo.parse}"
  var_prefix="${2:?Variable prefix not passed to srcinfo.parse}"
  srcinfo.cleanup "${var_prefix}"
  [[ ! -s ${srcinfo_file} ]] && return 5
  while IFS= read -r line; do
    # Skip blank lines
    [[ -z ${line} ]] && continue
    [[ ${line} =~ ^\s*#.* ]] && continue
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
        export globase="${temp_line[value]}"
      else
        locbase="${temp_line[value]//-/_}"
        export globase="temporary_pacstall_pkgbase"
      fi
    elif [[ ${temp_line[key]} == *"pkgname" ]]; then
      # Bash can't have dashes in variable names
      locbase="${temp_line[value]//-/_}"
    fi
    # Next we need to parse out individual keys.
    # So the strategy is to create arrays of every key and at the end,
    # we can promote array.len() == 1 to variables instead. After that we
    # can work back upwards.
    temp_array="$(srcinfo._create_array "${locbase}" "${temp_line[key]}" "${var_prefix}")"
    declare -n ref="${temp_array}"
    ref+=("${temp_line[value]}")
    if [[ ${locbase} == "pkgbase_"* ]] || ! srcinfo._contains total_list "${temp_array}"; then
      total_list+=("${temp_array}")
    fi
  done < "${srcinfo_file}"
  declare -Ag "${var_prefix}_access"
  for loop in "${total_list[@]}"; do
    declare -n part="${loop}"
    # Are we at a new pkgname (pkgbase)?
    if [[ ${loop} == *@(pkgname|pkgbase) ]]; then
      declare -n var_name="${var_prefix}_access"
      [[ ${loop} == "${var_prefix}_pkgbase"* ]] && global="pkgbase_"
      for i in "${!part[@]}"; do
        # Create our inner part
        declare -ga "${var_prefix}_${global}${part[${i}]//-/_}"
        # Declare that relationship
        var_name["${var_prefix}_${global}${part[${i}]//-/_}"]="${var_prefix}_${global}${part[${i}]//-/_}"
      done
      unset global
    fi
  done
  for part_two in "${total_list[@]}"; do
    # Now we need to go and check every loop over, and parse it out so we get something like ("prefix", "key"), so we can then work with that.
    # But first actually we should promote single element arrays to variables
    declare -n referoo="${part_two}"
    if (("${#referoo[@]}" == 1)); then
      srcinfo._promote_to_variable "${part_two}"
    fi
    mapfile -t split_up <<< "${part_two/_array_/$'\n'}"
    declare -n addarr="${split_up[0]}"
    unset "${split_up[1]}"
    # So now we need to check if the thing we're trying to insert is a variable,
    # or an array.
    if srcinfo.is_array "${part_two}"; then
      declare -ga "${part_two}"
      # shellcheck disable=SC2004
      addarr[${split_up[1]}]="${part_two}"
    else
      # shellcheck disable=SC2034,SC2004
      addarr[${split_up[1]}]="${!part_two}"
    fi
  done
}

function srcinfo.cleanup() {
  local var_prefix="${1:?No var_prefix passed to srcinfo.cleanup}" i z
  local main_loop_template="${var_prefix}_access" compg
  declare -n main_loop="${main_loop_template}"
  for i in "${main_loop[@]}"; do
    declare -n cleaner="${i}"
    for z in "${cleaner[@]}"; do
      unset "${var_prefix}_array_${z}"
    done
    unset cleaner
  done
  unset "${var_prefix}_access" globase global
  # So now lets clean the stragglers that we can't reasonably infer
  mapfile -t compg < <(compgen -v)
  for i in "${compg[@]}"; do
    if [[ ${i} == "${var_prefix}_"* ]]; then
      unset -v "${i}"
    fi
  done
}

# @description Reformat numbered associative array to indexed
#
# @example
#   srcinfo_depends_vala_panel_appmenu_xfce_git=(["vala-panel-appmenu-valapanel-git-0"]="gtk3")
#   srcinfo.reformat_assoc_arr "srcinfo_depends_vala_panel_appmenu_xfce_git" "eviler"
#
#   converts to `srcinfo_depends_vala_panel_appmenu_valapanel_git=([0]="gtk3")`
#
# @arg $1 string Associative array to reformat
# @arg $2 string Ref string of indexed array to append conversion to (can be anything)
function srcinfo.reformat_assoc_arr() {
  local pfx base ida new pfs in_name="${1}"
  local -n in_arr="${in_name}" app="${2}"
  IFS='_' read -r -a pfs <<< "${in_name}"
  for pfx in "${!in_arr[@]}"; do
    base="${pfx%-*}" ida="${pfx##*-}" new="${base//-/_}"
    app+=("$(printf "%s[%s]=\"%s\"\n" "${pfs[0]}_${pfs[1]}_${new}" "${ida}" "${in_arr[${pfx}]}")")
  done
}

# @description Parse a specific variable from .SRCINFO
#
# @example
#
#   srcinfo.print_var .SRCINFO source
# @arg $1 string .SRCINFO file path
# @arg $2 string Variable or Array to print
function srcinfo.print_var() {
  local srcinfo_file="${1}" found="${2}" var_prefix="srcinfo" pkgbase output var name idx evil eviler e printed
  local -n bases="${var_prefix}_access"
  srcinfo.parse "${srcinfo_file}" "${var_prefix}"
  if [[ ${found} == "pkgbase" ]]; then
    if [[ -n ${globase} && ${globase} != "temporary_pacstall_pkgbase" ]]; then
      pkgbase="${globase}"
      declare -p pkgbase
      return 0
    else
      return 3
    fi
  fi
  for var in "${bases[@]}"; do
    declare -n output="${var}_array_${found}"
    declare -n name="${var}_array_pkgname"
    if [[ -n ${output[*]} ]]; then
      for idx in "${!output[@]}"; do
        if ((${#bases[@]} > 1)); then
          # shellcheck disable=SC2076
          if [[ ${var} =~ "pkgbase_${globase//-/_}" ]]; then
            evil+=("$(printf "${var_prefix}_${found}_${globase//-/_}[\"${globase}-pkgbase-%d\"]=\"%s\"\n" "${idx}" "${output[${idx}]}")")
          else
            evil+=("$(printf "${var_prefix}_${found}_${globase//-/_}[\"${name}-%d\"]=\"%s\"\n" "${idx}" "${output[${idx}]}")")
          fi
        else
          evil+=("$(printf "${var_prefix}_${found}_${name//-/_}[\"${name}-%d\"]=\"%s\"\n" "${idx}" "${output[${idx}]}")")
        fi
      done
    fi
  done
  if [[ -n ${globase} && ${globase} != "temporary_pacstall_pkgbase" ]]; then
    unset "${var_prefix}_${found}_${globase//-/_}"
    declare -Ag "${var_prefix}_${found}_${globase//-/_}"
  else
    unset "${var_prefix}_${found}_${name//-/_}"
    declare -Ag "${var_prefix}_${found}_${name//-/_}"
  fi
  # shellcheck disable=SC2294
  eval "${evil[@]}"
  if [[ -n ${globase} && ${globase} != "temporary_pacstall_pkgbase" ]]; then
    srcinfo.reformat_assoc_arr "${var_prefix}_${found}_${globase//-/_}" "eviler"
    unset "${var_prefix}_${found}_${globase//-/_}"
    # shellcheck disable=SC2294
    eval "${eviler[@]}"
  else
    srcinfo.reformat_assoc_arr "${var_prefix}_${found}_${name//-/_}" "eviler"
    unset "${var_prefix}_${found}_${name//-/_}"
    # shellcheck disable=SC2294
    eval "${eviler[@]}"
  fi
  for e in "${eviler[@]}"; do
    if ! srcinfo._contains printed "${e%\[*}"; then
      printed+=("${e%\[*}")
      declare -p "${e%\[*}"
    fi
    unset "${e%\[*}"
  done
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
  local declares d bases b guy match out srcfile="${1}" search="${2}" pkg="${3}"
  if [[ ${pkg} == "pkgbase:"* || ${search} == "pkgbase" ]]; then
    pkg="${pkg/pkgbase:/}"
    match="srcinfo_${search%%_*}_${pkg//-/_}_pkgbase"
  else
    match="srcinfo_${search%%_*}_${pkg//-/_}"
  fi
  mapfile -t declares < <(srcinfo.print_var "${srcfile}" "${search}" | awk '{sub(/^declare -a |^declare -- |^declare -x /, ""); print}')
  [[ ${search} == "pkgbase" && -z ${declares[*]} ]] \
    && mapfile -t declares < <(srcinfo.print_var "${srcfile}" "pkgname" | awk '{sub(/^declare -a |^declare -- |^declare -x /, ""); print}')
  for d in "${declares[@]}"; do
    if [[ ${d%=\(*} =~ = ]]; then
      declare -- "${d}"
      bases+=("${d%=*}")
    else
      declare -a "${d}"
      bases+=("${d%=\(*}")
    fi
  done
  for b in "${bases[@]}"; do
    guy="${b}[@]"
    if [[ -z ${pkg} ]]; then
      if [[ ${search} == "pkgname" || ${search} == "pkgbase" ]]; then
        if [[ -n ${pkgbase} ]]; then
          out="${pkgbase/\"/}"
          out="${out/\"/}"
          printf '%s\n' "pkgbase:${out}"
          continue
        fi
        printf '%s\n' "${!guy}"
        continue
      else
        printf '%s\n' "${guy}"
        continue
      fi
    fi
    [[ ${b} == "${match}" ]] && printf '%s\n' "${!guy}"
  done
}

function srcinfo.pkg_list() {
  local origname outlist inlist pkgnames
  mapfile -t inlist < <(ls -1 packages)
  for i in "${inlist[@]}"; do
    if [[ -n $(awk '/^pkgbase=/' "packages/${i}/${i}.pacscript") ]]; then
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
  exit "${ret}"
}

function srcinfo.cmd() {
  if [[ ${1} == "write" ]]; then
    shift 1
    # list of packages to write to
    srcinfo.write_out "${@}"
  elif [[ ${1} == "check" ]]; then
    shift 1
    # check if .SRCINFOs exist
    srcinfo.repo_check "${@}"
  elif [[ ${1} == "packagelist" ]]; then
    # no args
    srcinfo.pkg_list > packagelist
  elif [[ ${1} == "read" ]]; then
    # see srcinfo.match_pkg for description
    # shellcheck disable=SC2086
    srcinfo.match_pkg "${2:?No SRCINFO file provided}" "${3:?No variable provided}" ${4}
  else
    srcinfo.die "options: read | write | packagelist | check"
  fi
}

srcinfo.cmd "${@}"
# vim:set ft=sh ts=2 sw=4 noet:
