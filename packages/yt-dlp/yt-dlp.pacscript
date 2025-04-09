pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.03.31"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("0e8bc5558efce5ae2a6397710eed72fd8d434e45904e4fe029dd21c610a95d4d")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
