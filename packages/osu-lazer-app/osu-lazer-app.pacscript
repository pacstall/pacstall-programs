pkgname="osu-lazer-app"
arch=("amd64")
pkgver="2025.1205.0"
_pkgtag="lazer"
pkgdesc="The future of osu! and the beginning of an open era! Commonly known by the codename osu!lazer. Pew pew."
url='https://osu.ppy.sh'
license=("MIT" "CC-BY-NC-4.0")
depends=("libfuse2")
conflicts=("osu-lazer" "osu-lazer-git")
replaces=("osu-lazer-tachyon-app")
noextract=("osu.AppImage")
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/ppy/osu/releases/download/${pkgver}-${_pkgtag}/osu.AppImage"
  # png is ignored so i have to take it from the repo
  "icon.png::https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png"
  "osu-lazer"
  "osu-lazer.desktop"
)
sha256sums=(
  "4e539f91f7c89812f80679eaea0f97f21ef9057ff0ce6ff2e1f47183bfbb9c2b"
  "30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51"
  "18f9ab3e98e5cc93a5da9baaa3b065c6511e126306107dfb51633406f3e49b0a"
  "e08a76a780960fffbd63fed26df21f0e7846d9bc8b366bfdbb54b07bf543113e"
)

package() {
  cd "${srcdir}"

  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/osu-lazer/osu.AppImage"
  install -Dm755 -t "${pkgdir}/usr/bin" osu-lazer
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/osu-lazer.png"
  install -Dm644 -t "${pkgdir}/usr/share/applications" osu-lazer.desktop
}
