pkgname="yt-dlp"
repology=("project: ${pkgname}")
arch=("all")
pkgver="2024.11.04"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}")
pkgdesc="A youtube-dl fork with additional features and fixes"
sha256sums=("dad4a9ce9db902cf1e69ca71c0ca778917fa5a804a2ab43bac612b0abef76314")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
