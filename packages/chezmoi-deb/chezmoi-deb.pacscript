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
version="2.31.0"
url="https://github.com/twpayne/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.deb"
description="Manage your dotfiles across multiple diverse machines, securely"
hash="92eada753f7e5414032c2853b33424f697887c172475016487b8e55cf789e289"
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
