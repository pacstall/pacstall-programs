pkgname="osu-lazer-app"
arch=("amd64")
pkgver="2025.605.3"
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
url="https://osu.ppy.sh"
license=("MIT" "CC-BY-NC-4.0")
depends=("libfuse2")
conflicts=("osu-lazer" "osu-lazer-git")
noextract=("osu.AppImage")
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/ppy/osu/releases/download/${pkgver}/osu.AppImage"
  # png is ignored so i have to take it from the repo
  "icon.png::https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png"
  "osu-lazer"
  "osu-lazer.desktop"
)
sha256sums=(
  "934f5fc9a49f199802ed5a03a7af3ec5be70c625c64259572aa0a9cfeee4d12a"
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
