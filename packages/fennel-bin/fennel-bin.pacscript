#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel-bin"
pkgname="fennel"
pkgdir="${STOWDIR}/${name}"
version="1.2.0"
description="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${version}-x86_64"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="f813d7a4e23b0d1a09c5087f76828ef29cba38d8446041d292cac43cbd6a7449"
repology=("project: fennel")

prepare() {
  true
}

build() {
  true
}

install() {

  # Install binary
  sudo install -Dm755 "fennel-${version}-x86_64" "${pkgdir}/usr/bin/${pkgname}"

}
# vim:set ft=sh ts=2 sw=2 et:
