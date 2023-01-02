#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="shfmt-bin"
pkgname="shfmt"
version="3.6.0"
url="https://github.com/mvdan/sh/releases/download/v${version}/shfmt_v${version}_linux_amd64"
description="Format shell programs"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-deb ${pkgname}-app"
hash="5741a02a641de7e56b8da170e71a97e58050d66a3cf485fb268d6a5a8bb74afb"
repology=("project: ${pkgname}")

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
