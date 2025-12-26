#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="fennel-bin"
gives="fennel"
pkgver="1.5.3"
pkgdesc="A Lua Lisp language"
source=("https://fennel-lang.org/downloads/fennel-${pkgver}-x86_64")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("d9c348de0040f02dce7f0452b8d9bb5e29fb292a8bad883778e43d9b9d4be3bb")
arch=('amd64')
repology=("project: fennel")

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 "fennel-${pkgver}-x86_64" "${pkgdir}/usr/bin/${gives}"

}
# vim:set ft=sh ts=2 sw=2 et:
