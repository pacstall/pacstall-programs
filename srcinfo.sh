#!/usr/bin/env bash
set -e

CARCH=@CARCH@ DISTRO=ubuntu:jammy
distros="focal jammy mantic noble oracular buster bullseye bookworm trixie sid devel"
vars="source depends makedepends optdepends pacdeps checkdepends provides conflicts breaks replaces"
archs="amd64 arm64 armel armhf i386 mips64el ppc64el riscv64 s390x"
sums="b2 sha512 sha384 sha256 sha224 sha1 md5"
_distros="{${distros// /,}}" _vars="{${vars// /,}}" _archs="{${archs// /,}}" _sums="{${sums// /,}}"
allvars=(pkgname gives pkgver pkgrel epoch pkgdesc url priority)
allars=(arch source depends makedepends checkdepends optdepends pacdeps conflicts breaks replaces provides incompatible compatible backup mask noextract nosubmodules license maintainer repology)
eval "allars+=(${_vars}_${_distros} ${_vars}_${_archs} ${_vars}_${_distros}_${_archs} gives_${_distros} gives_${_archs} gives_${_distros}_${_archs} ${_sums}sums ${_sums}sums_${_distros} ${_sums}sums_${_archs} ${_sums}sums_${_distros}_${_archs})"

function srcinfo() {
  local var ar elem a

  # shellcheck disable=1090
  source "${1}"
  for var in "${allvars[@]}"; do
    local -n ref="${var}"
    [[ -n ${ref} ]] || continue
    ref="${ref//+([[:space:]])/ }"
    ref="${ref#[[:space:]]}"
    ref="${ref%[[:space:]]}"
    echo "${var} = ${ref}"
  done
  for ar in "${allars[@]}"; do
    local -n ref="${ar}"
    [[ -n ${ref[*]} ]] || continue
    for elem in "${ref[@]}"; do
      elem="${elem//+([[:space:]])/ }"
      elem="${elem#[[:space:]]}"
      elem="${elem%[[:space:]]}"
      if [[ ${elem} = *@CARCH@* ]]; then
        for a in "${arch[@]}"; do
          : "${ar}_${a} = ${elem}"
          echo "${_//@CARCH@/${a}}"
        done
      else
        echo "${ar} = ${elem}"
      fi
    done
  done
}

(($# <= 0)) && echo "You failed to specify a pacscript." && exit 1

for f; do
  srcinfo "${f}" > "${f%/*}/.SRCINFO" &
done
wait

# vim:set ft=sh ts=2 sw=2 et:
