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
version="2.34.2"
url="https://github.com/twpayne/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.deb"
description="Manage your dotfiles across multiple diverse machines, securely"
hash="81467cb32dd0d14d854194dcc88de65ece472c923de007d9d6bc3a11e1c584c8"
arch=('amd64')
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
