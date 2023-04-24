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
version="2.33.3"
url="https://github.com/twpayne/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.deb"
description="Manage your dotfiles across multiple diverse machines, securely"
hash="12273df5b712d14f5e9e8775bcbc89557437d144c3014db62d1a30e90b7a94e3"
arch=('amd64')
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
