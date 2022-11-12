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
version="1.0.0"
description="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${version}/pacup"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="d3d568bb4c09d8c22eb835e90c061f46d0586195e7c2a763450423523c245fd8"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:
