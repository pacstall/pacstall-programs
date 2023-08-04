#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="librewolf-app"
pkgname="librewolf"
version="115.0.2-2"
description="A fork of Firefox, focused on privacy, security and freedom."
url="https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${version}/LibreWolf.x86_64.AppImage"
hash="5041364eb688fb44ff4c95ad387f3a7063139b2079870a77c57494e11537fbe3"
arch=('amd64')
breaks=("${pkgname}-deb" "${pkgname}-bin" "${pkgname}-git")
repology=("project: librewolf")

package() {
  # Install appimage
  sudo install -Dm755 "LibreWolf.x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -q https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

post_remove() {
  # Delete .librewolf
  if ask "Do you want to delete ~/.librewolf/ files?" Y; then
    rm -rf ~/.librewolf/
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
