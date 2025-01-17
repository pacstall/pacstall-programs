pkgname="cromite-bin"
gives="cromite"
pkgver="132.0.6834.83"
pkgsha="36e27b9c60c551348fe4e65a537d16c76d9b48e8"
arch=("amd64")
pkgdesc="Cromite is a Chromium fork based on Bromite with built-in support for ad blocking and an eye for privacy"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
	"https://github.com/uazo/${gives}/releases/download/v${pkgver}-${pkgsha}/chrome-lin64.tar.gz"
	"https://www.cromite.org/app_icon.png"
)
sha256sums=(
	"0bff256a9aecabf0d9552a6bbc7e4941b71ccd2e3f4d00a729b247916be039c0"
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
