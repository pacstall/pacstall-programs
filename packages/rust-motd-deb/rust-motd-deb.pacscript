#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="rust-motd-deb"
gives="rust-motd"
replace=("${gives}")
version="1.0.1"
url="https://github.com/rust-motd/rust-motd/releases/download/v${version}/rust-motd_${version}_amd64.deb"
description="Beautiful, useful, configurable MOTD generation with zero runtime dependencies"
hash="e2abcb97de92bee14cdc85e8dec46af17c15fdb03cc3a4b3d6094b1c2a079670"
arch=('amd64')
repology=("project: rust:motd")

# vim:set ft=sh ts=2 sw=2 et:
