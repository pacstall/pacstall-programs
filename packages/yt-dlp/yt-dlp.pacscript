name="yt-dlp"
repology=("project: ${name}")
pkgver="2024.03.10"
url="https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp"
depends=("python3" "ffmpeg")
breaks=("${name}-git" "${name}-bin" "${name}")
pkgdesc="A youtube-dl fork with additional features and fixes"
hash="5576348930e44102add235c0a032e766f416a507db1dd2c75da833ff21e9fb6c"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
