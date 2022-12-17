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
version="1.0.1"
description="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${version}/pacup"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="b8ab6b541a9a8993204d4c5825fc4ad44bfc50f524e6b4a439170c5dacfb84bc"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:
