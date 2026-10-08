#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="btop-bin"
gives="btop"
pkgver="1.4.7"
source=("https://github.com/aristocratos/btop/releases/download/v${pkgver}/btop-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="A monitor of system resources, bpytop ported to C++"
breaks=("${gives}" "${gives}-git" "${gives}-deb")
sha256sums=("5099054dd6a101bd12eb6ff3702a9a6a3f57aaa27923a0da478ae5b517faf335")
arch=('amd64')
repology=("project: ${gives}")

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
