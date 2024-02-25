name="wezterm-bin"
pkgname="wezterm"
gives="wezterm"
pkgver="20240203-110809-5046fc22"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
url="https://github.com/wez/wezterm/releases/download/${pkgver}/wezterm-${pkgver}.Ubuntu22.04.tar.xz"
hash="142cb46de648200b852cc4b1d932e6b8f2a9d3c55f6dc5af44b6d4eeb9385f5c"
breaks=("${pkgname}-app")
repology=("project: wezterm")
maintainer="smokeythemonkey <smokeythemonkey@posteo.net>"

package() {
  # Install Binaries
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm" -t "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/open-wezterm-here" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/strip-ansi-escapes" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm-gui" "${pkgdir}/usr/bin/"
  sudo install -Dm755 "${SRCDIR}/wezterm/usr/bin/wezterm-mux-server" "${pkgdir}/usr/bin/"

  # Copy Icons and plugins
  sudo cp -r "${SRCDIR}/wezterm/usr/share/"* "/usr/share/"

  # Install .desktop file
  sudo install -Dm644 "${SRCDIR}/wezterm/usr/share/applications/org.wezfurlong.wezterm.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"

  # Install wezterm.sh script
  sudo install -Dm755 "${SRCDIR}/wezterm/etc/profile.d/wezterm.sh" "${pkgdir}/etc/profile.d/wezterm.sh"
}

post_install() {
  # Run wezterm.sh script to hook up shell integration
  sudo "/etc/profile.d/wezterm.sh"
}

post_remove() {
  # Remove additional files
  sudo rm -f "/usr/share/bash-completions/wezterm"
  sudo rm -f "/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"
  sudo rm -f "/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml"
  sudo rm -f "/usr/share/nautilus-python/extensions/wezterm-nautilus.py"
  sudo rm -rf "/usr/share/wezterm/"
  sudo rm -f "/usr/share/zsh/functions/Completion/Unix/_wezterm"

  # Delete wezterm config
  if ask "Do you want to delete wezterm config files?" N; then
    rm -rf "${homedir}/.config/.wezterm/"
  fi
}
