#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
pkgdir="${STOWDIR}/${name}"
version="1.2.0"
description="A Lua Lisp language"
depends="lua5.3"
url="https://fennel-lang.org/downloads/fennel-${version}"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="cb4999d1766a6f244d3005f0cd32cc777c7f0ff83bbc7a75e4ec2c2518a3f0dc"
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
