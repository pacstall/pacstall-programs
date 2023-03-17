#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel-bin"
pkgname="fennel"
version="1.3.0"
description="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${version}-x86_64"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="f3d1119cd4f226fe01c82465b53013bddc6a85ed550eadced581a5381804073b"
arch=('amd64')
repology=("project: fennel")

install() {
  # Install binary
  sudo install -Dm755 "fennel-${version}-x86_64" "${pkgdir}/usr/bin/${pkgname}"

}
# vim:set ft=sh ts=2 sw=2 et:
