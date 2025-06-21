pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.06.09"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("efba94b3be7911b96bf35bb7437dcf218ab7d244def6d57982af5609f9aeeeb0")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
