pkgname="yt-dlp"
repology=("project: ${pkgname}")
pkgver="2023.12.30"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("1965bf8dcf181a8e6adb99c0ec4cdaaae5e2d01ba1f5198f68535305d5ae94b2")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
