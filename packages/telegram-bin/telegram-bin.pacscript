#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="3.5.1"
description="Telegram Desktop messaging app"
url="https://updates.tdesktop.com/tlinux/tsetup.${version}.tar.xz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="62702b3bd7c28260f7f33adde098d8306546ee39e5e5705520d63563bec3f164"

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
