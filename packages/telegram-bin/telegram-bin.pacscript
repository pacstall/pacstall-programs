#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.1.8"
description="Telegram Desktop messaging app"
url="https://github.com/telegramdesktop/tdesktop/releases/download/v${version}/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git"
hash="19eeeb931b401afd8da8811be8d56b993662833f67035114489447544871e5cd"

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
