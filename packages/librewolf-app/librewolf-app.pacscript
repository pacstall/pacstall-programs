maintainer="Oren Klopfer <oren@taumoda.com>"
name="librewolf-app"
pkgname="librewolf"
pkgver="121.0-1"
pkgdesc="A fork of Firefox, focused on privacy, security and freedom."
arch=('amd64' 'arm64')
source=(
  "https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
)
source_amd64=("LibreWolf.AppImage::https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.x86_64.AppImage")
source_arm64=("LibreWolf.AppImage::https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.aarch64.AppImage")
hash=('SKIP' 'SKIP')
hash_amd64=("63178bcc1feacc94f657ea86cf86aac8d8e272e7646ddef189eede99236fd81e")
hash_arm64=("b0a6c690bd7a2f5f5d364c82115ee945445822c97adb5d258038769f8054a5c6")
breaks=("${pkgname}-deb" "${pkgname}-bin" "${pkgname}-git")
repology=("project: librewolf")

package() {
  # Install appimage
  sudo install -Dm755 LibreWolf.AppImage "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  sudo install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

post_remove() {
  # Delete ~/.librewolf if it exists
  if [[ -d "${homedir}/.librewolf" ]]; then
    if ask "Do you want to delete ~/.librewolf/ files?" Y; then
      rm -rf "${homedir}/.librewolf"
    fi
  fi
}
# vim:set ft=sh ts=2 sw=2 et:
