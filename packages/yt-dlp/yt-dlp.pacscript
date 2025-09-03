pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.07.21"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("d6ff4b07579a491436d83413cad1ff18f5fa2a01f80effceb9b70147276ffeb8")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
