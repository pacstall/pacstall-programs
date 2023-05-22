#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="opera-deb"
gives="opera-stable"
replace=("${gives}")
version="99.0.4788.13"
url="https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${version}_amd64.deb"
description="Multi-platform web browser developed by its namesake company Opera"
hash="ffe71b23f51b45c57a4996c42ee9182adf6621c2053af075480bc2a04c1c6fe6"
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:
