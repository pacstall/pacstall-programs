pkgname="osu-lazer-tachyon-app"
gives="osu-lazer"
arch=("amd64")
pkgver="2025.625.0-tachyon"
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew. - Tachyon Release"
url='https://osu.ppy.sh'
license=("MIT" "CC-BY-NC-4.0")
depends=("libfuse2")
conflicts=("${gives}" "${gives}-git")
replaces=("${gives}-app")
noextract=("osu.AppImage")
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/ppy/osu/releases/download/${pkgver}/osu.AppImage"
  # png is ignored so i have to take it from the repo
  "icon.png::https://raw.githubusercontent.com/ppy/osu/refs/tags/${pkgver}/assets/lazer.png"
  "osu-lazer"
  "osu-lazer.desktop"
)
sha256sums=(
  "8c6dca79d9659d535de532d290a61a7b657c0b337dd20e652614f810a23e9ee9"
  "30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51"
  "baeea5b234e65707a4e6a563eacac89063bf20047d64125cd1f26c3c52aae957"
  "e08a76a780960fffbd63fed26df21f0e7846d9bc8b366bfdbb54b07bf543113e"
)

package() {
  cd "${srcdir}"

  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/osu-lazer/osu.AppImage"
  install -Dm755 -t "${pkgdir}/usr/bin" osu-lazer
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/osu-lazer.png"
  install -Dm644 -t "${pkgdir}/usr/share/applications" osu-lazer.desktop
}