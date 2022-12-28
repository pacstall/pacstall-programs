#!/bin/bash
# shellcheck disable=2034
# shellcheck disable=2154
# shellcheck disable=2032
# shellcheck disable=2033
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fnlfmt"
pkgdir="${STOWDIR}/${name}"
version="0.2.3"
description="A more intuitive version of du in rust"
url="https://git.sr.ht/~technomancy/fnlfmt/archive/${version}.tar.gz"
gives="${pkgname}"
breaks="${pkgname}-bin ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
depends="lua5.3"
hash="0a7d7aaf4d88a81b6f13ed02fa88e74ed6c634ba50254de09eeb5a7777ae90d6"
repology=("project: fnlfmt")

prepare() {
  true
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo install -D "${name}" "${pkgdir}/usr/bin/${name}"
}

# vim:set ft=sh ts=2 sw=2 et:
