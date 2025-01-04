#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="btop-bin"
gives="btop"
pkgver="1.4.0"
source=("https://github.com/aristocratos/btop/releases/download/v${pkgver}/btop-x86_64-linux-musl.tbz")
pkgdesc="A monitor of system resourecs, bpytop ported to C++"
breaks=("${gives}" "${gives}-git" "${gives}-deb")
sha256sums=("2e49cde9c0f273e5b1699d2c4f1ce5d1c08cca5fd90e5e0226dbac9fd00c82f3")
arch=('amd64')
repology=("project: ${gives}")

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
