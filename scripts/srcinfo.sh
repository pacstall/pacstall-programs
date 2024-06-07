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

shopt -s extglob

function die() {
  printf >&2 'ERROR: %s\n' "$@"
  exit 1
}

function vars.srcinfo() {
  local _distros _vars _archs _sums distros \
    vars="source depends makedepends optdepends pacdeps checkdepends provides conflicts breaks replaces enhances recommends makeconflicts checkconflicts" \
    archs="amd64 x86_64 arm64 aarch64 armel arm armhf armv7h i386 i686 mips64el ppc64el riscv64 s390x" \
    sums="b2 sha512 sha384 sha256 sha224 sha1 md5"
  allvars=(pkgname gives pkgver pkgrel epoch pkgdesc url priority)
  allars=(arch source depends makedepends checkdepends optdepends pacdeps conflicts makeconflicts checkconflicts breaks replaces provides enhances recommends incompatible compatible backup mask noextract nosubmodules license maintainer repology custom_fields)
  distros=$(awk '{sub(/\/.*/, "", $1); gsub(/:$/, "", $1); distros=distros $1 " "} END {sub(/ $/, "", distros); print distros}' distrolist)
  _distros="{${distros// /,}}" _vars="{${vars// /,}}" _archs="{${archs// /,}}" _sums="{${sums// /,}}"
  eval "allars+=(${_vars}_${_distros} ${_vars}_${_archs} ${_vars}_${_distros}_${_archs} ${_sums}sums ${_sums}sums_${_distros} ${_sums}sums_${_archs} ${_sums}sums_${_distros}_${_archs})"
  eval "allvars+=(gives_${_distros} gives_${_archs} gives_${_distros}_${_archs})"
}

function gen.srcinfo() {
  local CARCH='CARCH_REPLACE' DISTRO='DISTROBASE:DISTROVER' AARCH='AARCH_REPLACE' var ar aars bar ars rar rep seek
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
  for var in "${allvars[@]}"; do
    declare -n "rar=${var}"
    if [[ -n ${rar} ]]; then
      rar="${rar//+([[:space:]])/ }"
      rar="${rar#[[:space:]]}"
      rar="${rar%[[:space:]]}"
      echo "${var} = ${rar}"
    fi
  done
  for ar in "${allars[@]}"; do
    declare -n "bar=${ar}"
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
            if [[ " ${AARCHS_MAP[*]} " =~ " ${ar##*_} " || " ${!AARCHS_MAP[*]} " =~ " ${ar##*_} " || ${ar} == *"x86_64" ]]; then
              : "${ar} = ${ars}"
              [[ ${ar} != *"${aars}" ]] && continue
            else
              : "${ar}_${aars} = ${ars}"
            fi
            echo "${_//${seek}/${rep}}"
          done
        else
          echo "${ar} = ${ars}"
        fi
      done
    fi
  done
  unset "${allars[@]}" "${allvars[@]}"
}

(($# <= 0)) && die "You failed to specify a pacscript"

vars.srcinfo
for i in "${@}"; do
  [[ -f ${i} && -w ${i} ]] || die "Not a file: ${i}"
  gen.srcinfo "${i}" > "${i%/*.pacscript}"/.SRCINFO &
done
wait

# vim:set ft=sh ts=2 sw=4 noet:
