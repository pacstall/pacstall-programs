#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="btop-bin"
gives="btop"
pkgver="1.4.3"
source=("https://github.com/aristocratos/btop/releases/download/v${pkgver}/btop-x86_64-linux-musl.tbz")
pkgdesc="A monitor of system resourecs, bpytop ported to C++"
breaks=("${gives}" "${gives}-git" "${gives}-deb")
sha256sums=("98f11024899fea672490a2d9515f8b8b863c09f33e0e681f4fdbaa37abfd464a")
arch=('amd64')
repology=("project: ${gives}")

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
