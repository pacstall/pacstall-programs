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
version="1.0.0"
description="A Lua Lisp language"
url="https://fennel-lang.org/downloads/fennel-${version}-x86_64"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="4b5871bb0c1ceb50dac6ada0b2e60a04f775eee15f8056c01b2ece5938c3046b"

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
