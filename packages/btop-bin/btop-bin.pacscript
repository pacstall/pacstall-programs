#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="btop-bin"
pkgname="btop"
version="1.2.7"
url="https://github.com/aristocratos/btop/releases/download/v${version}/btop-x86_64-linux-musl.tbz"
description="A monitor of system resourecs, bpytop ported to C++"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb"
hash="b3b7cd2a8ef6ebbbadab3ca7689096efa3e4b1e4e11b9a68ed6dedb1e3475fb5"
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
