pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2026.02.21"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("91d023f421dffd6fd354d233edb784a05d5dde2c1c585fcb599d5cc23ecb759e")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
