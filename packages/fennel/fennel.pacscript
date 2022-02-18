#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="fennel"
pkgdir="${STOWDIR}/${name}"
version="1.0.0"
description="A Lua Lisp language"
depends="lua5.3"
url="https://fennel-lang.org/downloads/fennel-${version}"
breaks="${name}-bin ${name}-git ${name}-deb ${name}-app"
hash="875ff5e69652d3d38f8e6146350138adf32787390c12a233774f7d1abd180ada"

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
