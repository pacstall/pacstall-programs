#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="shfmt-bin"
pkgname="shfmt"
version="3.4.2"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/mvdan/sh/releases/download/v${version}/shfmt_v${version}_linux_amd64"
description="Format shell programs"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-deb ${pkgname}-app"
hash="9cc743f058ab8896ca6fa94a7f2e570b95294e8a142600f09fe832e406a88f18"

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
