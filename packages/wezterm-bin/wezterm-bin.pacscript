pkgname="wezterm-bin"
gives="wezterm"
pkgver="20230712-072601-f4abf8fd"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
source=("https://github.com/wez/wezterm/releases/download/${pkgver}/wezterm-${pkgver}.Ubuntu22.04.tar.xz")
sha256sums=("3b03b75a26a30f2de28180d66c5556e5878f6f3320d79d12fb78ea486400b6c3")
breaks=("${gives}-app")
repology=("project: wezterm")
maintainer=("smokeythemonkey <smokeythemonkey@posteo.net>")

package() {
  cd "${_archive}"
  # Install Binaries
  install -Dm755 "${srcdir}/wezterm/usr/bin/wezterm" -t "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/wezterm/usr/bin/open-wezterm-here" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/wezterm/usr/bin/strip-ansi-escapes" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/wezterm/usr/bin/wezterm-gui" "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/wezterm/usr/bin/wezterm-mux-server" "${pkgdir}/usr/bin/"

  # Copy Icons and plugins
  cp -r "${srcdir}/wezterm/usr/share/"* "/usr/share/"

  # Install .desktop file
  install -Dm644 "${srcdir}/wezterm/usr/share/applications/org.wezfurlong.wezterm.desktop" "${pkgdir}/usr/share/applications/org.wezfurlong.wezterm.desktop"

  # Install wezterm.sh script
  install -Dm755 "${srcdir}/wezterm/etc/profile.d/wezterm.sh" "${pkgdir}/etc/profile.d/wezterm.sh"
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
