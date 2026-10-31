PACSTALL_DOWNLOADER=curl
_gives=lunarclient
pkgname="${_gives}-app"
repology=("project: lunar-client")
pkgver="3.7.28"
arch=("amd64")
pkgdesc="Lunar Client is the free all-in-one modpack available on all versions of Minecraft that enhances your gameplay experience by providing you with all of your favorite mods, settings, and cosmetics!"
url='https://lunarclient.com'
makedepends=("libfuse2")
replaces=("lunarclient" "lunar-client")
breaks=("lunarclient-deb" "lunarclient-bin")
maintainer=("Mythbusters123 <atr10605@icloud.com>")
_appimage="Lunar%20Client-${pkgver}-ow.AppImage"
source=(
  "https://launcher-releases.lunarclientprod.com/master/6e18b5a4f4ebbd4c7ecff572f1700cedce1f248bcb157adce5ec49be9e081a23/${_appimage}"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.png"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.desktop"
)
sha256sums=(
  'f79e41dc877fc3865463e3c5d507aab4ee2f572649ec28380cf02a657c53f968'
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
