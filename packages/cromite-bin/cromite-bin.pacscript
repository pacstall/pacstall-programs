pkgname="cromite-bin"
gives="cromite"
pkgver="138.0.7204.184"
pkgsha="0509d052981e047d6670967788a3e916c70fd4b9"
arch=("amd64")
pkgdesc="Cromite is a Chromium fork based on Bromite with built-in support for ad blocking and an eye for privacy"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
  "https://github.com/uazo/${gives}/releases/download/v${pkgver}-${pkgsha}/chrome-lin64.tar.gz"
  "https://www.cromite.org/app_icon.png"
)
sha256sums=(
  "babcd56252aa76ba616f186a0b1da1b428e34f693070833370d36a87e651ed71"
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
