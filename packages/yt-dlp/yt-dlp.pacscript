name="yt-dlp"
repology=("project: ${name}")
pkgver="2023.10.07"
url="https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp"
depends=("python3" "ffmpeg")
breaks=("${name}-git" "${name}-bin" "${name}")
pkgdesc="A youtube-dl fork with additional features and fixes"
hash="47743cde1f66f16f8ef8440b78171877122b1277f906dbebfb7d49fb4c64ab0b"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
