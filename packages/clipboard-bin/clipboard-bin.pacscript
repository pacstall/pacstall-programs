#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="clipboard-bin"
pkgname="clipboard"
version="0.7.1"
description="Cut, copy, and paste anything in your terminal"
url="https://github.com/Slackadays/Clipboard/releases/download/${version}/${pkgname}-linux-amd64.zip"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="3d9772a03f9d9d5b1d406103e86eb0bffe15684337f452b73b97d38680b80580"
arch=('amd64')
repology=("project: clipboard")

install() {
  sudo install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  sudo install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  sudo install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
# vim:set ft=sh ts=2 sw=2 et:
