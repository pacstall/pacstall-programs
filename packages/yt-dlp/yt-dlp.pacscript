pkgname="yt-dlp"
repology=("project: ${pkgname}")
pkgver="2024.04.09"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("7f12092fb95ffa2c8947c855298c94c612c9c0e969e132d7eca5502981955c99")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
