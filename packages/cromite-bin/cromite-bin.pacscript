pkgname="cromite-bin"
gives="cromite"
pkgver="138.0.7204.97"
pkgsha="418943de425329115e0783375c12ee5aec36e2b6"
arch=("amd64")
pkgdesc="Cromite is a Chromium fork based on Bromite with built-in support for ad blocking and an eye for privacy"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
  "https://github.com/uazo/${gives}/releases/download/v${pkgver}-${pkgsha}/chrome-lin64.tar.gz"
  "https://www.cromite.org/app_icon.png"
)
sha256sums=(
  "0cd315866c9c5df0307067264c56fbde90947a30f1e621a73e98d5317ac9e54b"
  "95ea4e28bc95c30200d832c075a04d79191110573f8bbebf881b81c4cef6c211"
)
repology=("project: ${gives}")

package() {
  cd "${srcdir}/chrome-lin"
  mkdir -p "${pkgdir}/usr/share/cromite"
  cp -r ./* "${pkgdir}/usr/share/cromite"
  chmod +x "${pkgdir}/usr/share/cromite/chrome"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/app_icon.png" "${pkgdir}/usr/share/pixmaps/cromite.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cat << EOF > "${pkgdir}/usr/share/applications/cromite.desktop"
[Desktop Entry]
Name=Cromite
Comment=Take back your browser
Exec=/usr/share/cromite/chrome
Terminal=false
Type=Application
Icon=cromite
Categories=Network;WebBrowser;
StartupNotify=true
EOF
}
