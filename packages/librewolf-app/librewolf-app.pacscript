#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="librewolf-app"
pkgname="librewolf"
version="101.0.1-1"
description="A fork of Firefox, focused on privacy, security and freedom."
url="https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${version}/LibreWolf.x86_64.AppImage"
hash="bccff3e8db81e8c88444d01c2db8ab1118d1b22621c96f5c345d742b2c1de168"
breaks="${pkgname}-deb ${pkgname}-bin ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: librewolf")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install appimage
  sudo install -Dm755 "LibreWolf.x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -q https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

removescript() {
  # Delete .librewolf
  if ask "Do you want to delete ~/.librewolf/ files?" Y; then
    rm -rf ~/.librewolf/
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
