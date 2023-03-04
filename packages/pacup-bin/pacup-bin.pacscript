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
version="1.0.3"
description="Help maintainers update pacscripts"
url="https://github.com/pacstall/pacup/releases/download/${version}/pacup"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="64a27e15472b30435f87a3fafe6b50dd1542bfd264f36faf4d10791c950a24ea"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
# vim:set ft=sh ts=2 sw=2 et:
