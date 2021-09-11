#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="librewolf-app"
pkgname="librewolf"
version="92.0-1"
description="A fork of Firefox, focused on privacy, security and freedom."
url="https://gitlab.com/librewolf-community/browser/appimage/-/jobs/1580351789/artifacts/raw/LibreWolf-${version}.x86_64.AppImage"
hash="41569a9b5c1f58ab4dc26ef72d0c8363c43b5d33082046de5ebaf10c62a2e1d8"
breaks="${pkgname}-deb ${pkgname}-bin ${pkgname}-git"
removescript="yes"
pkgdir="${STOWDIR}/${name}"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install appimage
  sudo install -Dm755 "LibreWolf-${version}.x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

removescript() {
  # Remove .desktop file
  rm -f ~/.local/share/applications/userapp-LibreWolf-R8NL90.desktop

  # Delete .librewolf
  if ask "Do you want to delete ~/.librewolf/ files?" Y; then
    rm -rf ~/.librewolf/
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
