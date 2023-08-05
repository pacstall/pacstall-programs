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
pkgver="100.0.4815.76"
url="https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb"
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
hash="65ac81a38406d5d2fdd2ee2bc4e56d641fcba248292451f249b245edb0de3cd1"
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:
