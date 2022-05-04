#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="btop-bin"
pkgname="btop"
version="1.2.6"
pkgdir="${STOWDIR}/${name}"
url="https://github.com/aristocratos/btop/releases/download/v${version}/btop-x86_64-linux-musl.tbz"
description="A monitor of system resourecs, bpytop ported to C++"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="1a397aa860d2824f268fde3f20112df5d76a4e083694d93e16236f84e177c5f5"
repology=("project: btop")

prepare() {
  true
}

build() {
  true
}

install() {
  sudo make DESTDIR="${pkgdir}" install
}
# vim:set ft=sh ts=2 sw=2 et:
