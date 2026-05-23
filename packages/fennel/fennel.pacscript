#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fennel"
arch=("all")
pkgver="1.6.1"
pkgdesc="A Lua Lisp language"
depends=("lua5.3")
source=("https://fennel-lang.org/downloads/fennel-${pkgver}")
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
sha256sums=("8d0c1e838c5604b42151ea8696a41251bebacf299273c3c5b3c99c0c5ad7d6d7")
repology=("project: fennel")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "fennel-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
