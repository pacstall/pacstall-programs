pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2026.07.04"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("495be29ff4d9d4e9be7eabdfef225221e5d5282e77f2f505abc6dca80349f3fd")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
