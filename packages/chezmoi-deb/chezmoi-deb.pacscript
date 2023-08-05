#!/bin/bash
#-*- mode: sh-*-
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
# shellcheck disable=2034
name="chezmoi-deb"
gives="chezmoi"
pkgver="2.35.2"
url="https://github.com/twpayne/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.deb"
pkgdesc="Manage your dotfiles across multiple diverse machines, securely"
hash="7dd720f87f8121b31c1c4ec6fd793d0343162662d1dcab32a8b311bd59be2b14"
arch=('amd64')
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
