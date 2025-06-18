PACSTALL_DOWNLOADER=curl
_gives=lunarclient
pkgname="${_gives}-app"
repology=("project: lunar-client")
pkgver="3.3.11"
arch=("amd64")
pkgdesc="PvP modpack for all modern versions of Minecraft"
url='https://lunarclient.com'
makedepends=("libfuse2")
replaces=("lunarclient" "lunar-client")
breaks=("lunarclient-deb" "lunarclient-bin")
maintainer=("Mythbusters123 <atr10605@icloud.com>")
_appimage="Lunar%20Client-${pkgver}.AppImage"
source=(
  "https://launcherupdates.lunarclientcdn.com/${_appimage}"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.png"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.desktop"
)
sha256sums=(
  '6699e89408df5c21ba7b1a7508e8676f49d911709a195699efcff7c82a99a782'
  '28d489d41431bdaa784342a227abdfbbb525bbe831f98d34747ec557b6e02f05'
  'SKIP'
)

build() {
  cd "${srcdir}"
  sed -i "s/REPLACE_VERSION/${pkgver}/" "${srcdir}/${_gives}.desktop"
}

package() {
  cd "${srcdir}"
  # AppImage
  install -Dm755 \
    "${_appimage}" \
    "${pkgdir}/usr/bin/${_gives}"

  # Desktop file
  install -Dm655 \
    "${srcdir}/${_gives}.desktop" \
    "${pkgdir}/usr/share/applications/${_gives}.desktop"

  # Icon image
  install -Dm644 \
    "${srcdir}/${_gives}.png" \
    "${pkgdir}/usr/share/pixmaps/${_gives}.png"
}
post_install() {
  fancy_message warn "By using Lunar Client you agree to the Terms of Service and the Privacy Policy"
  fancy_message warn "found at https://www.lunarclient.com/terms and https://www.lunarclient.com/privacy, respectively"
}
