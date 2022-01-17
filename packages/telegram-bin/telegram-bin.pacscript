#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.4.3"
description="Telegram Desktop messaging app"
url="https://github.com/telegramdesktop/tdesktop/releases/download/v${version}/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git"
hash="c6ff9ad17e9337e080f0477a974ff7ca7d41680680758344fbd5300c5bb1623b"

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
