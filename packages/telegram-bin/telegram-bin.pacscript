#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="4.0.1"
description="Telegram Desktop messaging app"
url="https://updates.tdesktop.com/tlinux/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="38506faddcda439ba3832be03829c9ce35c2b46bf7acf4488771405470ac06b3"
repology=("project: telegram-desktop")

pkgdir="/usr/src/pacstall/${name}"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install binary
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
