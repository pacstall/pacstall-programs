PACSTALL_DOWNLOADER=curl
_gives=lunarclient
pkgname="${_gives}-app"
repology=("project: lunar-client")
pkgver="3.2.4"
arch=("amd64")
pkgdesc="PvP modpack for all modern versions of Minecraft"
homepage='https://lunarclient.com'
makedepends=("libfuse2")
replaces=("lunarclient" "lunar-client")
breaks=("lunarclient-deb" "lunarclient-bin")
maintainer=("Mythbusters123 <atr10605@icloud.com>")
_appimage="Lunar%20Client-${pkgver}.AppImage"
source=("https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('aae0a052ce84c2f88d7ffaa36af3d794502202b79095353fd5f2de548a639a01')
_iconurl="https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.png"
_iconhash='28d489d41431bdaa784342a227abdfbbb525bbe831f98d34747ec557b6e02f05'
_desktopurl="https://raw.githubusercontent.com/Mythbusters123/lunarclient-app/main/${_gives}.desktop"
_desktophash='419c6bcea780a9cc735fec2ea956f67978bb8d82e321e074c36754f61baa36b8'

prepare() {
  cd "${_archive}"
  # Be extra careful!
  wget -O "${_gives}.png" -q "${_iconurl}"
  wget -O "${_gives}.desktop" -q "${_desktopurl}"

  _downloaded_icon_hash="$(sha256sum "${_gives}.png" | cut -d " " -f 1)"
  _downloaded_desktop_hash="$(sha256sum "${_gives}.desktop" | cut -d " " -f 1)"

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
  cd "${_archive}"
  sed -i "s/REPLACE_VERSION/${pkgver}/" "${_gives}.desktop"
}

package() {
  cd "${_archive}"
  # AppImage
  sudo install -Dm755 \
    "${_appimage}" \
    "${pkgdir}/usr/bin/${_gives}"

  # Desktop file
  sudo install -Dm655 \
    "${_gives}.desktop" \
    "${pkgdir}/usr/share/applications/${_gives}.desktop"

  # Icon image
  sudo install -Dm644 \
    "${_gives}.png" \
    "${pkgdir}/usr/share/pixmaps/${_gives}.png"
}
post_install() {
  fancy_message warn "By using Lunar Client you agree to the Terms of Service and the Privacy Policy"
  fancy_message warn "found at https://www.lunarclient.com/terms and https://www.lunarclient.com/privacy, respectively"
}
