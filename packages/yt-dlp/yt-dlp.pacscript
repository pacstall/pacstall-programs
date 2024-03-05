name="yt-dlp"
repology=("project: ${name}")
pkgver="2023.12.30"
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp")
depends=("python3" "ffmpeg")
breaks=("${name}-git" "${name}-bin" "${name}")
pkgdesc="A youtube-dl fork with additional features and fixes"
hash=("1965bf8dcf181a8e6adb99c0ec4cdaaae5e2d01ba1f5198f68535305d5ae94b2")
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
