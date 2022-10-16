#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="btop-bin"
pkgname="btop"
version="1.2.12"
url="https://github.com/aristocratos/btop/releases/download/v${version}/btop-x86_64-linux-musl.tbz"
description="A monitor of system resourecs, bpytop ported to C++"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb"
hash="975b35284aa1020545633f91cfcfd5827ec67b39c5d0980126911248eaff8eb3"
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
