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
pkgver="101.0.4843.58"
url="https://deb.opera.com/opera/pool/non-free/o/opera-stable/${gives}_${pkgver}_amd64.deb"
pkgdesc="Multi-platform web browser developed by its namesake company Opera"
hash="35a392125af2b31226cd99c17911ddd66b0395090bad51dbecdf107300bfe99d"
arch=('amd64')
repology=("project: opera")

# vim:set ft=sh ts=2 sw=2 et:
