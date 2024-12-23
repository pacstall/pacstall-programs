#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fennel"
arch=("all")
pkgver="1.3.1"
pkgdesc="A Lua Lisp language"
depends=("lua5.3")
source=("https://fennel-lang.org/downloads/fennel-${pkgver}")
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
sha256sums=("40a64d31a69803213d0e56f839814d5a13ae6fc40cc435b0c3be294e2ccda1ca")
repology=("project: fennel")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "fennel-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
