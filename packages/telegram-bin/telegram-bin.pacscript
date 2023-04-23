#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="telegram-bin"
pkgname="telegram"
version="4.8.0"
description="Telegram Desktop messaging app"
url="https://updates.tdesktop.com/tlinux/tsetup.${version}.tar.xz"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="1b9eaa18b246afbef24329870300a2e5c085bda80b624f8674adbd3653492373"
repology=("project: telegram-desktop")

install() {
  # Install binary
  sudo install -Dm755 "Telegram" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
