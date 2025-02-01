pkgname="ungoogled-chromium-bin"
gives="ungoogled-chromium"
pkgver="132.0.6834.110-1"
arch=("amd64")
pkgdesc="Google Chromium, sans integration with Google"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ungoogled-software/${gives}-portablelinux/releases/download/${pkgver}/${gives}_${pkgver}_linux.tar.xz")
sha256sums=("fe55213ae2d479750f9df3eaf02dc68c0e2b09c674323b2c7a77e93f61b70cab")
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
