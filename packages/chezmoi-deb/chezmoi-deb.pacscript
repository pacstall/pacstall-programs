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
pkgver="2.38.0"
url="https://github.com/twpayne/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.deb"
pkgdesc="Manage your dotfiles across multiple diverse machines, securely"
hash="71b1815e294ab74b4ef04b74623a63e0286465fec1aeaefdfe19c85fe6d2cf51"
arch=('amd64')
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
