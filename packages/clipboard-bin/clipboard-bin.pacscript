#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="clipboard-bin"
pkgname="clipboard"
version="0.7.0"
description="Cut, copy, and paste anything in your terminal."
url="https://github.com/Slackadays/Clipboard/releases/download/${version}/${pkgname}-linux-amd64.zip"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="c9d0cef0b87436115f313c10099585381faf609d01d3276a73c912fcde9f78f4"
arch=('amd64')
repology=("project: clipboard")

install() {
  sudo install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  sudo install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  sudo install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
# vim:set ft=sh ts=2 sw=2 et:
