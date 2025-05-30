pkgname="ungoogled-chromium-bin"
gives="ungoogled-chromium"
pkgver="136.0.7103.113-1"
arch=("amd64")
pkgdesc="Google Chromium, sans integration with Google"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ungoogled-software/${gives}-portablelinux/releases/download/${pkgver}/${gives}_${pkgver}_linux.tar.xz")
sha256sums=("d7805c19dfefd89d1e43328419742d04eb633d6eee82e84c5c57be6946e46c5b")
repology=("project: ${gives}")

prepare() {
  mkdir -p "${pkgdir}/usr/share/${gives}"
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  cd "${srcdir}/${gives}_${pkgver}_linux"
  cp -r ./* "${pkgdir}/usr/share/${gives}"
  chmod +x "${pkgdir}/usr/share/${gives}/chrome"
  install -Dm644 product_logo_48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/chromium.png"
  cat << EOF > "${pkgdir}/usr/share/applications/chromium.desktop"
[Desktop Entry]
Name=Chromium
Comment=Web Browser
Exec=/usr/share/ungoogled-chromium/chrome
Terminal=false
Type=Application
Icon=chromium
Categories=Network;WebBrowser;
StartupNotify=true
EOF
}
