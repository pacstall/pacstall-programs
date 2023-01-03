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
version="2.29.1"
url="https://github.com/twpayne/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.deb"
description="Manage your dotfiles across multiple diverse machines, securely"
hash="5ff941b4102b54c4a385e2ae41e3fef1b27c3e1f3d522b074340e1181e2ffc0e"
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
