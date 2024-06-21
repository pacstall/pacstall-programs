pkgname="yt-dlp"
repology=("project: ${pkgname}")
pkgver="2024.05.27"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("b67769b0d68dbdc59a6d217713a37443b5a12c1d377c27c9946da8a537b995bb")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
