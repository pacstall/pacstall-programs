pkgname="ungoogled-chromium-bin"
gives="ungoogled-chromium"
pkgver="131.0.6778.139-1"
arch=("amd64")
pkgdesc="Google Chromium, sans integration with Google"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ungoogled-software/${gives}-portablelinux/releases/download/${pkgver}/${gives}_${pkgver}_linux.tar.xz")
sha256sums=("82da8451952cf8734f25e10ac527ab49a8eea339bf6eb6488c8ab032b8b77a14")
repology=("project: ${gives}")

package() {
  cd "${srcdir}/${gives}_${pkgver}_linux"
  mkdir -p "${pkgdir}/usr/share/ungoogled-chromium"
  cp -r ./* "${pkgdir}/usr/share/ungoogled-chromium"
  chmod +x "${pkgdir}/usr/share/ungoogled-chromium/chrome"
  mkdir -p "${pkgdir}/usr/share/applications/"
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
