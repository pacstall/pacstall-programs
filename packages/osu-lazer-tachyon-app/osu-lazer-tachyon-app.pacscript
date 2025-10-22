pkgname="osu-lazer-tachyon-app"
gives="osu-lazer"
arch=("amd64")
pkgver="2025.1022.0"
_pkgtag="tachyon"
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew. - Tachyon Release"
url='https://osu.ppy.sh'
license=("MIT" "CC-BY-NC-4.0")
depends=("libfuse2")
conflicts=("${gives}" "${gives}-git")
replaces=("${gives}-app")
noextract=("osu.AppImage")
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/ppy/osu/releases/download/${pkgver}-${_pkgtag}/osu.AppImage"
  # png is ignored so i have to take it from the repo
  "icon.png::https://raw.githubusercontent.com/ppy/osu/refs/tags/${pkgver}-${_pkgtag}/assets/lazer.png"
  "osu-lazer"
  "osu-lazer.desktop"
)
sha256sums=(
  "d0f02be6d06267769d1bdf0e26647abf5c287d2f08c6dde67d8b20525d1139a0"
  "30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51"
  "8f7f8ea193ffe960364ca1344e1ca3780281a0a753f34700732655b75e30cc6b"
  "e08a76a780960fffbd63fed26df21f0e7846d9bc8b366bfdbb54b07bf543113e"
)

package() {
  cd "${srcdir}"

  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/osu-lazer/osu.AppImage"
  install -Dm755 -t "${pkgdir}/usr/bin" osu-lazer
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/osu-lazer.png"
  install -Dm644 -t "${pkgdir}/usr/share/applications" osu-lazer.desktop
}
