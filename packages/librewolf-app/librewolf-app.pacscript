pkgname="librewolf-app"
gives="librewolf"
pkgver="130.0-3"
pkgdesc="A fork of Firefox, focused on privacy, security and freedom."
arch=('amd64' 'arm64')
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
sha256sums_amd64=(
  "103bf16bdbea3bdb9910febc1635fc3ec715a16f49607908c08660fab30c6915"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "c1a067e09e2f9d98f9d7f6f435a8767b06ed405c7c46b26b1b59eb2aa961c55b"
  "SKIP"
  "SKIP"
)
source_amd64=(
  "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.x86_64.AppImage"
  "icon.png::https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
source_arm64=(
  "https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/${pkgver}/LibreWolf.aarch64.AppImage"
  "icon.png::https://gitlab.com/uploads/-/system/group/avatar/5407097/icon.png"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
breaks=("${gives}-deb" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")

package() {
  if [[ ${CARCH} == amd64 ]]; then
    gnuarch="x86_64"
  else
    gnuarch="aarch64"
  fi

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
