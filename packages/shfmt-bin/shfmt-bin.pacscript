#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="shfmt-bin"
pkgname="shfmt"
version="3.4.3"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/mvdan/sh/releases/download/v${version}/shfmt_v${version}_linux_amd64"
description="Format shell programs"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-deb ${pkgname}-app"
hash="713ef49db9a60a00636814a507da851b58da6b4b98a3627188fba0a61b60f9a8"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "shfmt_v${version}_linux_amd64" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
