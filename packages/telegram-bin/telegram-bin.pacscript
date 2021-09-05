#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.0.1"
description="Telegram Desktop messaging app"
url="https://github.com/telegramdesktop/tdesktop/releases/download/v${version}/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git"
hash="42220fbd3d3c6c7e4809487880350451f5624a2c99297a385c7289abc7fce75e"

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
