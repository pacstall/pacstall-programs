pkgname="wezterm-bin"
gives="wezterm"
arch=("amd64")
pkgver="20230712-072601-f4abf8fd"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
source=("@${pkgname}~${pkgver}::https://github.com/wez/wezterm/releases/download/${pkgver}/wezterm-${pkgver}.Ubuntu22.04.tar.xz")
sha256sums=("3b03b75a26a30f2de28180d66c5556e5878f6f3320d79d12fb78ea486400b6c3")
breaks=("${gives}-app")
repology=("project: wezterm")
maintainer=("smokeythemonkey <smokeythemonkey@posteo.net>")

package() {
  cd "${pkgname}~${pkgver}"
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
  # Delete wezterm config
  if ask "Do you want to delete wezterm config files?" N; then
    rm -rf "${homedir}/.config/.wezterm/"
  fi
}
