pkgname="osu-lazer-app"
arch=("amd64")
pkgver="2024.906.1"
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
url="https://osu.ppy.sh"
license=("MIT" "CC-BY-NC-4.0")
depends=("libfuse2")
conflicts=("osu-lazer" "osu-lazer-git")
noextract=("osu.AppImage")
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/ppy/osu/releases/download/${pkgver}/osu.AppImage"
  # Gotta use files from AUR until this pacscript pushed
  "icon.png::https://aur.archlinux.org/cgit/aur.git/plain/icon.png?h=osu-lazer-bin"
  "osu-lazer"
  "osu-lazer.desktop"
)
sha256sums=(
  "3a656f53458b2d60bb3942db761d7a8fcc0cbf33538d2c7363ba7da57f43d3a5"
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
