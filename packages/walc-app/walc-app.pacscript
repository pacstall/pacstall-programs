#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="walc-app"
pkgname="walc"
pkgdir="/usr/src/pacstall/${name}"
homedir="/home/$(logname)"
description="An unofficial WhatsApp Desktop client for linux systems."
url="https://github.com/cstayyab/WALC/releases/download/v0.2.1/walc.AppImage"
hash="6c1e5c004e9c4bc5a8cf15837ce0e6c884fb3ace6397aa6aa95a6738c1960560"
breaks="${pkgname} ${pkgname}-bin"
removescript="yes"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install binary
  sudo install -Dm755 "walc.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

removescript() {
  # Remove .desktop file
  sudo rm -f "${homedir}/.local/share/applications/WALC.desktop"

  # Remove left over .config files
  if ask "Do you want to remove left over configuration files?" Y; then
    sudo rm -rf "${homedir}/.config/${pkgname}"
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
