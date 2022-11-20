#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="shfmt-bin"
pkgname="shfmt"
version="3.5.1"
url="https://github.com/mvdan/sh/releases/download/v${version}/shfmt_v${version}_linux_amd64"
description="Format shell programs"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-deb ${pkgname}-app"
hash="56099a689b68534f98e1f8f05d3df6750ab53e3db68f514ee45595bf5b79d158"
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
