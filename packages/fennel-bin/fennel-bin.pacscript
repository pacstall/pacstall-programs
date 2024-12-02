#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fennel-bin"
gives="fennel"
pkgver="1.3.1"
pkgdesc="A Lua Lisp language"
source=("https://fennel-lang.org/downloads/fennel-${pkgver}-x86_64")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("85b71175739dfd5e8893726d7244b0f0b58fd21eaec009e39eea44ad7169f060")
arch=('amd64')
repology=("project: fennel")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "fennel-${pkgver}-x86_64" "${pkgdir}/usr/bin/${gives}"

}
# vim:set ft=sh ts=2 sw=2 et:
