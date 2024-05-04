#!/usr/bin/env bash

function srcinfo() {
  local CARCH='CARCH_REPLACE' DISTRO='ubuntu:jammy' valid_distros=("${2}") vdist src sum vars a_sum var ar car aars bar ars rar \
    known_hashsums_src=("b2" "sha512" "sha384" "sha256" "sha224" "sha1" "md5") \
    known_archs_src=("amd64" "arm64" "armel" "armhf" "i386" "mips64el" "ppc64el" "riscv64" "s390x") \
    allvars=("pkgname" "gives" "pkgver" "pkgrel" "epoch" "pkgdesc" "url" "priority") \
    allars=("arch" "source" "depends" "makedepends" "checkdepends" "optdepends" "pacdeps" "conflicts" "breaks" \
    "replaces" "provides" "incompatible" "compatible" "backup" "mask" "noextract" "nosubmodules" "license" "maintainer" "repology")
  for vars in {source,depends,makedepends,optdepends,pacdeps,checkdepends,provides,conflicts,breaks,replaces}; do
    for vdist in "${valid_distros[@]}"; do
      allars+=("${vars}_${vdist}")
    done
    for src in "${known_archs_src[@]}"; do
      allars+=("${vars}_${src}")
      for s_vdist in "${valid_distros[@]}"; do
        allars+=("${vars}_${s_vdist}_${src}")
      done
    done
  done
  for vdist in "${valid_distros[@]}"; do
    allvars+=("gives_${vdist}")
  done
  for src in "${known_archs_src[@]}"; do
    allvars+=("gives_${src}")
    for vdist in "${valid_distros[@]}"; do
      allvars+=("gives_${vdist}_${src}")
    done
  done
  for sum in "${known_hashsums_src[@]}"; do
    allars+=("${sum}sums")
    for vdist in "${valid_distros[@]}"; do
      allars+=("${sum}sums_${vdist}")
    done
    for a_sum in "${known_archs_src[@]}"; do
      allars+=("${sum}sums_${a_sum}")
      for vdist in "${valid_distros[@]}"; do
        allars+=("${sum}sums_${vdist}_${a_sum}")
      done
    done
  done
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
            echo "${ar}_${aars} = ${ars}" | sed -e "s/CARCH_REPLACE/${aars}/g"
          done
        else
          echo "${ar} = ${ars}"
        fi
      done
    fi
  done
  unset "${allars[@]}" "${allvars[@]}"
}

write_all() {
  local packagelist
  mapfile -t packagelist < packagelist
  export -f srcinfo
  # shellcheck disable=SC2016
  for package in "${packagelist[@]}"; do
      srcinfo packages/"${package}"/"${package}".pacscript "${parsed_distros[@]}" | tee packages/"${package}"/.SRCINFO > /dev/null
  done
}

fetch_distros() {
  mapfile -t parsed_distros < <(curl -fsSL https://salsa.debian.org/debian/distro-info-data/-/raw/main/{ubuntu.csv,debian.csv} \
    | awk -F ',' -v current_date="$(date +'%Y-%m-%d')" '
      NR > 1 && (($6 > current_date) || ($7 > current_date) || ($6 == "")) &&
      ($4 <= current_date) && $3 != "series" && $3 != "experimental" {
        print $3
      }
      END {print "devel"}
  ')
  export parsed_distros_str="${parsed_distros[*]}"
}

(($# <= 0)) && echo "You failed to specify a pacscript." && exit 1
fetch_distros

case ${1} in
  "write_all") write_all ;;
  *.pacscript) srcinfo "${1}" "${parsed_distros[@]}" ;;
  *) echo "Please specify a pacscript or use write_all." && exit 1 ;;
esac
unset parsed_distros parsed_distros_str

# vim:set ft=sh ts=2 sw=4 noet:
