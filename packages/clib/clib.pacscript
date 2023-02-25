#!/usr/bin/bash
# shellcheck disable=2034,2032,2033
#-*- mode: sh-*-
name="clib"
version="2.8.2"
description="C package manager-ish"
url="https://github.com/clibs/${name}/archive/refs/tags/${version}.tar.gz"
build_depends="gcc libcurl4-gnutls-dev"
hash="e6bb5bcac18ad64070b70836750a0f3752cbe5fe31e9acd455a700ee57f3a799"
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr/local/"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
