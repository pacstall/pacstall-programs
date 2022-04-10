#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
pkgdir="${STOWDIR}/${name}"
version="1.1.0"
description="A Lua Lisp language"
depends="lua5.3"
url="https://fennel-lang.org/downloads/fennel-${version}"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="a21dfbdefe8e70b7692fd9c91740296e4753f965b55de31c94b7f44c16521095"
repology=("project: fennel")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install binary
  sudo install -Dm755 "fennel-${version}" "${pkgdir}/usr/bin/${name}"
}
# vim:set ft=sh ts=2 sw=2 et:
