pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.11.12"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("89a0d9058ea9018e380b7771898ff46e393a1986dcd13fef331693c87ce1fca4")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
