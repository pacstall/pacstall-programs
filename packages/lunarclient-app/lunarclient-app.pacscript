PACSTALL_DOWNLOADER=curl
_pkgname=lunarclient
name="${_pkgname}-app"
repology=("project: lunar-client")
pkgver="3.2.3"
arch=("amd64")
pkgdesc="PvP modpack for all modern versions of Minecraft"
homepage='https://lunarclient.com'
makedepends=("libfuse2")
replaces=("lunarclient" "lunar-client")
breaks=("lunarclient-deb" "lunarclient-bin")
maintainer="Mythbusters123 <atr10605@icloud.com>"
_appimage="Lunar%20Client-${pkgver}.AppImage"
source=(
  "https://launcherupdates.lunarclientcdn.com/${_appimage}"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_pkgname}.png"
  "https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_pkgname}.desktop"
)
hash=(
  '4074b895f9dba07d5ebdcf556489b62498c88731728ab555cf4ad5345d15bf12'
  '28d489d41431bdaa784342a227abdfbbb525bbe831f98d34747ec557b6e02f05'
  '419c6bcea780a9cc735fec2ea956f67978bb8d82e321e074c36754f61baa36b8'
)

build() {
  sed -i "s/REPLACE_VERSION/${pkgver}/" "${_pkgname}.desktop"
}

package() {
  # AppImage
  sudo install -Dm755 \
    "${_appimage}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  sudo install -Dm655 \
    "${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon image
  sudo install -Dm644 \
    "${_pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
post_install() {
  fancy_message warn "By using Lunar Client you agree to the Terms of Service and the Privacy Policy"
  fancy_message warn "found at https://www.lunarclient.com/terms and https://www.lunarclient.com/privacy, respectively"
}
