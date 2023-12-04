#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="clipboard-bin"
gives="clipboard"
pkgver="0.8.3"
pkgdesc="Cut, copy, and paste anything in your terminal"
url="https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${gives}-linux-amd64.zip"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="c7940c38e48dcf021103a1a91bc36a4ce43b9d00555e055914e1208cc807c925"
arch=('amd64')
repology=("project: clipboard")

package() {
  sudo install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  sudo install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  sudo install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}
# vim:set ft=sh ts=2 sw=2 et:
