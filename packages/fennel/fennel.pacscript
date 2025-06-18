#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fennel"
arch=("all")
pkgver="1.5.3"
pkgdesc="A Lua Lisp language"
depends=("lua5.3")
source=("https://fennel-lang.org/downloads/fennel-${pkgver}")
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
sha256sums=("7edd9c6b0bb055e29434e655766100609c255be021336f5bb2b572672c55cc10")
repology=("project: fennel")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "fennel-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
