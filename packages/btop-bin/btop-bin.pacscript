#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="btop-bin"
pkgname="btop"
version="1.2.5"
pkgdir="${STOWDIR}/${name}"
url="https://github.com/aristocratos/btop/releases/download/v${version}/btop-x86_64-linux-musl.tbz"
description="A monitor of system resourecs, bpytop ported to C++"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="cd36810e46eed3581cdb286d220ad0c560d5ef5d6aa663899672626653a06600"
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
