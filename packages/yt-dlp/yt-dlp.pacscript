pkgname="yt-dlp"
repology=("project: ${pkgname}")
pkgver="2024.08.06"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("2f77f6a200733fec8367031a52a75b2b02973ea25322d1488a4bfd059bc69c49")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
