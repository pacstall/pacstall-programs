#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="caprine-deb"
gives="caprine"
pkgver="2.60.3"
source=("https://github.com/sindresorhus/caprine/releases/download/v${pkgver}/caprine_${pkgver}_amd64.deb")
pkgdesc="Elegant Facebook Messenger desktop app"
sha256sums=("9e307a7aa1667eeca7a8d38b49e34e5b11dfb49b5e60d3adc81472bd176922a3")
arch=('amd64')
repology=("project: caprine")

# vim:set ft=sh ts=2 sw=2 et:
