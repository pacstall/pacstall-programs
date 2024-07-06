pkgname="yt-dlp"
repology=("project: ${pkgname}")
pkgver="2024.07.01"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("2d026b34f1aa2333a309b503c61de3719ed2f5683a52924d65c4ad25d7a8edcc")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
