#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel-bin"
pkgname="fennel"
pkgver="1.3.1"
pkgdesc="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${pkgver}-x86_64"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="85b71175739dfd5e8893726d7244b0f0b58fd21eaec009e39eea44ad7169f060"
arch=('amd64')
repology=("project: fennel")

package() {
  # Install binary
  sudo install -Dm755 "fennel-${pkgver}-x86_64" "${pkgdir}/usr/bin/${pkgname}"

}
