name="wezterm-app"
pkgname="wezterm"
gives="wezterm"
version="20221119-145034-49b9839f"
description="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
url="https://github.com/wez/wezterm/releases/download/${version}/WezTerm-${version}-Ubuntu18.04.AppImage"
hash="2eddde41f2814619be2cd06e3863003c5c19805d8ce5980fd97660bfd9bead39"
breaks="${pkgname}-git"
repology=("project: wezterm")
maintainer="smokeythemonkey <smokeythemonkey@posteo.net>"

install() {
  # Install AppImage
  sudo install -Dm755 "WezTerm-${version}-Ubuntu18.04.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  wget -q https://github.com/wez/wezterm/blob/main/assets/icon/terminal.png
  sudo install -Dm644 "terminal.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"

  # Install .desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"
}

removescript() {
  # Delete wezterm config
  if ask "Do you want to delete ~/.wezterm/ files?" N; then
    rm -rf ~/.config/.wezterm/
  fi
}
