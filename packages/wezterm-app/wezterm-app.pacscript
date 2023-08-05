name="wezterm-app"
pkgname="wezterm"
gives="wezterm"
pkgver="20230408-112425-69ae8472"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
url="https://github.com/wez/wezterm/releases/download/${pkgver}/WezTerm-${pkgver}-Ubuntu20.04.AppImage"
hash="24281a5369fb56144b4dcaafcaa1df621c2941b1a2d2e5576d76454d287cfd07"
breaks=("${pkgname}-bin")
repology=("project: wezterm")
maintainer="smokeythemonkey <smokeythemonkey@posteo.net>"

package() {
  # Install AppImage
  sudo install -Dm755 "WezTerm-${pkgver}-Ubuntu20.04.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -q https://github.com/wez/wezterm/blob/main/assets/icon/terminal.png
  sudo install -Dm644 "terminal.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"
}

post_remove() {
  # Delete wezterm config
  if ask "Do you want to delete ~/.wezterm/ files?" N; then
    rm -rf ~/.config/.wezterm/
  fi
}
