#!/usr/bin/env bash

function vars.srcinfo() {
  local var ar aars bar ars rar _distros _vars _archs _sums distros \
    vars="source depends makedepends optdepends pacdeps checkdepends provides conflicts breaks replaces" \
    archs="amd64 arm64 armel armhf i386 mips64el ppc64el riscv64 s390x" \
    sums="b2 sha512 sha384 sha256 sha224 sha1 md5"
  allvars=(pkgname gives pkgver pkgrel epoch pkgdesc url priority)
  allars=(arch source depends makedepends checkdepends optdepends pacdeps conflicts breaks replaces provides incompatible compatible backup mask noextract nosubmodules license maintainer repology)
  # distros disabled until new arrays integrated
  # distros=$(awk -v ORS=' ' 'NF && !/:$/ {sub(/\/.*/, "", $1); print $1}' distrolist)
  # _distros="{${distros// /,}}" _vars="{${vars// /,}}" _archs="{${archs// /,}}" _sums="{${sums// /,}}"
  # eval "allars+=(${_vars}_${_distros} ${_vars}_${_archs} ${_vars}_${_distros}_${_archs} ${_sums}sums ${_sums}sums_${_distros} ${_sums}sums_${_archs} ${_sums}sums_${_distros}_${_archs})"
  # eval "allvars+=(gives_${_distros} gives_${_archs} gives_${_distros}_${_archs})"
  _vars="{${vars// /,}}" _archs="{${archs// /,}}" _sums="{${sums// /,}}" 
  eval "allars+=(${_vars}_${_archs} ${_sums}sums ${_sums}sums_${_archs})"
  eval "allvars+=(gives_${_archs})"
  export allars allvars
}

function gen.srcinfo() {
  local CARCH='CARCH_REPLACE' DISTRO='ubuntu:jammy'
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
        if [[ ${ars} =~ CARCH_REPLACE ]]; then
          for aars in "${arch[@]}"; do
            : "${ar}_${aars} = ${ars}"
            echo "${_//CARCH_REPLACE/${aars}}"
          done
        else
          echo "${ar} = ${ars}"
        fi
      done
    fi
  done
  unset "${allars[@]}" "${allvars[@]}"
}

(($# <= 0)) && echo "You failed to specify a pacscript." && exit 1

vars.srcinfo
for i in "${@}"; do
  gen.srcinfo "${i}" > "${i%/*.pacscript}"/.SRCINFO &
done
wait
unset allars allvars

# vim:set ft=sh ts=2 sw=4 noet:
