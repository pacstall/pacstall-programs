name="yt-dlp"
repology=("project: ${name}")
pkgver="2023.10.13"
url="https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp"
depends=("python3" "ffmpeg")
breaks=("${name}-git" "${name}-bin" "${name}")
pkgdesc="A youtube-dl fork with additional features and fixes"
hash="be5cfb6be8930e1a5f427533ec32f2a481276b3da7b249d0150ce2b740ccf1ce"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
