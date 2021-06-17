#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="walc-git"
pkgname="walc"
pkgdir="/usr/src/pacstall/${name}"
description="An unofficial WhatsApp Desktop client for linux systems."
url="https://github.com/cstayyab/WALC.git"
depends="nodejs npm"
buid_depends="mmv"
breaks="${pkgname} ${pkgname}-bin"
removescript="yes"


pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
  # Install dependencies
  npm install
}

build() {
  # Build walc
  npm run build
}

install() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  cd dist/
  mkdir -p "${pkgdir}/usr/bin"
  sudo mmv "WALC-*.AppImage" "${pkgdir}/usr/bin/walc.AppImage"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
