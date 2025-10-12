#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="btop-bin"
gives="btop"
pkgver="1.4.4"
source=("https://github.com/aristocratos/btop/releases/download/v${pkgver}/btop-x86_64-linux-musl.tbz")
pkgdesc="A monitor of system resourecs, bpytop ported to C++"
breaks=("${gives}" "${gives}-git" "${gives}-deb")
sha256sums=("fec7d1b59c671290a0f80d5a32617ea6d60412485fc04318fd194b9550ff6b49")
arch=('amd64')
repology=("project: ${gives}")

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
