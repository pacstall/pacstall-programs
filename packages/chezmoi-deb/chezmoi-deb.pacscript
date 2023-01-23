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
version="2.29.3"
url="https://github.com/twpayne/${gives}/releases/download/v${version}/${gives}_${version}_linux_amd64.deb"
description="Manage your dotfiles across multiple diverse machines, securely"
hash="809a45bdfc368237bce5785ffa9f5f90f303614c445633a03bd908e01d52ca8d"
maintainer="wizard-28 <wiz28@pm.me>"
repology=("project: chezmoi")

# vim:set ft=sh ts=2 sw=2 et:
