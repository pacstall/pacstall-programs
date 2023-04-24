#!/usr/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="pacup-bin"
pkgname="pacup"
gives="pacup"
version="1.1.0"
description="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${version}/pacup"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="05293392b01c7913ce6872c624e9cab630f7575da6392cd867c3a20024e1caa0"

install() {
  sudo install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:
