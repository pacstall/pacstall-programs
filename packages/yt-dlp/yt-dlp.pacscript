pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2025.09.05"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("0606206b9570f06ef6d720b5159760b7811b0e8693db89047613c80d7c76cee8")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
