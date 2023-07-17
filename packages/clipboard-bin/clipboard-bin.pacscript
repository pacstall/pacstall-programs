#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="clipboard-bin"
pkgname="clipboard"
version="0.8.0"
description="Cut, copy, and paste anything in your terminal"
url="https://github.com/Slackadays/Clipboard/releases/download/${version}/${pkgname}-linux-amd64.zip"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="d81f0b6d698332041ebeb388fd9ca49a839aad7102f0ac68365098aee78b57cc"
arch=('amd64')
repology=("project: clipboard")

package() {
  sudo install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  sudo install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  sudo install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
# vim:set ft=sh ts=2 sw=2 et:
