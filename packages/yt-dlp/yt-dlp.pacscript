name="yt-dlp"
repology=("project: ${name}")
version="2023.07.06"
url="https://github.com/yt-dlp/yt-dlp/releases/download/${version}/yt-dlp"
depends=("python3")
breaks=("${name}-git" "${name}-bin" "${name}")
description="A youtube-dl fork with additional features and fixes"
hash="cedf44a9cf3c241520a692c1006d276e6f434d4d945727c47cb1a70d32953f4a"

package() {
  sudo install -Dm755 "yt-dlp" -t "${pkgdir}/usr/bin"
}
