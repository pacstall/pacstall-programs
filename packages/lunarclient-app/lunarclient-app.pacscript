PACSTALL_DOWNLOADER=curl
_pkgname=lunarclient
name="${_pkgname}-app"
repology=("project: lunar-client")
pkgver="3.2.0"
arch=("amd64")
pkgdesc="PvP modpack for all modern versions of Minecraft"
homepage='https://lunarclient.com'
makedepends=("libfuse2")
replace=("lunarclient" "lunar-client")
breaks=("lunarclient-deb" "lunarclient-bin")
maintainer="Mythbusters123 <atr10605@icloud.com>"
_appimage="Lunar%20Client-${pkgver}.AppImage"
url="https://launcherupdates.lunarclientcdn.com/${_appimage}"
hash='63d4a371543eeed997eaf29d62e0f826d4c324d98c2a5884379625e35fd6263b'
_iconurl="https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_pkgname}.png"
_iconhash='28d489d41431bdaa784342a227abdfbbb525bbe831f98d34747ec557b6e02f05'
_desktopurl="https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_pkgname}.desktop"
_desktophash='419c6bcea780a9cc735fec2ea956f67978bb8d82e321e074c36754f61baa36b8'

prepare() {
  # Be extra careful!
  wget -O "${_pkgname}.png" -q "${_iconurl}"
  wget -O "${_pkgname}.desktop" -q "${_desktopurl}"

  _downloaded_icon_hash="$(sha256sum "${_pkgname}.png" | cut -d " " -f 1)"
  _downloaded_desktop_hash="$(sha256sum "${_pkgname}.desktop" | cut -d " " -f 1)"

  if [[ "${_downloaded_icon_hash}" != "${_iconhash}" ]]; then
    fancy_message error "Hashes do not match for icon. Aborting..."
    return 1
  fi

  if [[ "${_downloaded_desktop_hash}" != "${_desktophash}" ]]; then
    fancy_message error "Hashes do not match for desktop file. Aborting..."
    return 1
  fi
}

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
