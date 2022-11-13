#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
pkgdir="${STOWDIR}/${name}"
version="1.2.1"
description="A Lua Lisp language"
depends="lua5.3"
url="https://fennel-lang.org/downloads/fennel-${version}"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="61da909cc7393ece9c36c7c8a428e56b4786eeff5c8ce7c24ad8304c3c0efebf"
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
