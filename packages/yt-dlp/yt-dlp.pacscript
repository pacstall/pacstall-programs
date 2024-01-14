name="yt-dlp"
repology=("project: ${name}")
pkgver="2023.11.16"
url="https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp"
depends=("python3" "ffmpeg")
breaks=("${name}-git" "${name}-bin" "${name}")
pkgdesc="A youtube-dl fork with additional features and fixes"
hash="0b122b45079b60ef720ebf4f72cbe53139f284b11492a42673cf6aa52d1432d8"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
