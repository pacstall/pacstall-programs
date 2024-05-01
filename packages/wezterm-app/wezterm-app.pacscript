pkgname="wezterm-app"
gives="wezterm"
pkgver="20230712-072601-f4abf8fd"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
source=(
  "https://github.com/wez/wezterm/releases/download/${pkgver}/WezTerm-${pkgver}-Ubuntu20.04.AppImage"
  "wezterm-icon.svg::https://raw.githubusercontent.com/wez/wezterm/main/assets/icon/wezterm-icon.svg"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
)
sha256sums=(
  "68656714c332161c47862f74902d676088ba45ca3980d6d2cbc2c3d9dd4a9c72"
  "SKIP"
  "SKIP"
)
breaks=("${gives}-bin")
repology=("project: wezterm")
maintainer=("smokeythemonkey <smokeythemonkey@posteo.net>")

package() {
  cd "${_archive}"
  # Install AppImage
  install -Dm755 "WezTerm-${pkgver}-Ubuntu20.04.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Download icon
  install -Dm644 "${srcdir}/wezterm-icon.svg" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.svg"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"
}

post_remove() {
  # Delete wezterm config
  if ask "Do you want to delete ~/.config/wezterm/ files?" N; then
    rm -rf ~/.config/wezterm/
  fi
}
