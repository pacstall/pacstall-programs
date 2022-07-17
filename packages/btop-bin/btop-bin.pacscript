#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="btop-bin"
pkgname="btop"
version="1.2.8"
url="https://github.com/aristocratos/btop/releases/download/v${version}/btop-x86_64-linux-musl.tbz"
description="A monitor of system resourecs, bpytop ported to C++"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb"
hash="fd860e6d30e01fd6f30e161017cefceec799c5a617f9a5debc0947754b4d251c"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  sudo make DESTDIR="${STOWDIR}/${name}" install
}
# vim:set ft=sh ts=2 sw=2 et:
