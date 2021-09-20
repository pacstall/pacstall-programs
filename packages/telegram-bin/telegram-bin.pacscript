#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.1.0"
description="Telegram Desktop messaging app"
url="https://github.com/telegramdesktop/tdesktop/releases/download/v${version}/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git"
hash="cbf95fa5009f2d77a9057af61bba7c5dc41061ffc9fe15e89cfe3bd64550a10c"

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
