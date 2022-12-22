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
version="1.2.1"
description="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${version}-x86_64"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="6eba2f4e643f6e3ecf971c4bb5a685fba0b9e022de8b88c6aad5e4bc2d150c83"
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
