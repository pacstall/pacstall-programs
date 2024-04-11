maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="librewolf-app"
gives="librewolf"
pkgver="121.0-1"
pkgdesc="A fork of Firefox, focused on privacy, security and freedom."
arch=('amd64' 'arm64')
sha256sums_amd64=(
  "63178bcc1feacc94f657ea86cf86aac8d8e272e7646ddef189eede99236fd81e"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "b0a6c690bd7a2f5f5d364c82115ee945445822c97adb5d258038769f8054a5c6"
  "SKIP"
  "SKIP"
)
if [[ ${CARCH} == amd64 ]]; then
  gnuarch="x86_64"
else
  gnuarch="aarch64"
fi
source=(
  "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.${gnuarch}.AppImage"
  "icon.png::https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
breaks=("${gives}-deb" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")

package() {
  cd "${_archive}"
  # Install appimage
  install -Dm755 "LibreWolf.${gnuarch}.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Download icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
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
