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
version="1.1.0"
description="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${version}-x86_64"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="65046b2b65689ab03472fbd854d3541f03c388b229cb76e5337019a75603a4f2"
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
