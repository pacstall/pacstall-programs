pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.06.25"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("7925ac3ef520c3bb8c9c645ffbbabe8b7ee5b5a5ad6f2cb09d4a50212bbdd072")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
