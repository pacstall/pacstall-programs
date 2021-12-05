#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.2.5"
description="Telegram Desktop messaging app"
url="https://github.com/telegramdesktop/tdesktop/releases/download/v${version}/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git"
hash="82015812f6334bd5c8ee56204a946cf0a27344e48ce9f44bff87d0dc3f84ef03"

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
