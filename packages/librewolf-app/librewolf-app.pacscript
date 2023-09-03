maintainer="Oren Klopfer <oren@taumoda.com>"
name="librewolf-app"
pkgname="librewolf"
pkgver="117.0-1"
pkgdesc="A fork of Firefox, focused on privacy, security and freedom."
arch=('amd64' 'arm64')
if [[ ${CARCH} == "arm64" ]]; then
  gnuarch="aarch64"
  hash="e581bdf26e8e281da8ee9da4f3fc20bc70510b5f307a5b2b47680aed7023c3b9"
else
  gnuarch="x86_64"
  hash="26c80f59137681aed9f40f58c8f49f18bd329c94c680de9d5c0e10ebd2f2a580"
fi
url="https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.${gnuarch}.AppImage"
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
