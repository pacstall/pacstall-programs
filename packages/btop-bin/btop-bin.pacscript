#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="btop-bin"
gives="btop"
pkgver="1.2.13"
source=("https://github.com/aristocratos/btop/releases/download/v${pkgver}/btop-x86_64-linux-musl.tbz")
pkgdesc="A monitor of system resourecs, bpytop ported to C++"
breaks=("${gives}" "${gives}-git" "${gives}-deb")
sha256sums=("6c773ca064d314b4ea5d39d6fb0f73d6a3b74b9daa79ffae33c5b5df05bcf00a")
arch=('amd64')
repology=("project: ${gives}")

package() {
  cd "${_archive}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
