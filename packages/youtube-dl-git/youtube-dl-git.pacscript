name="youtube-dl-git"
gives="youtube-dl"
url="https://github.com/ytdl-org/youtube-dl.git"
pkgver="2021.12.17"
pkgdesc="Command-line program to download videos from YouTube.com and other video sites"
makedepends=("make" "pandoc" "python3")
depends=("python3")
maintainer="KwonNam Son <kwon37xi@gmail.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  git fetch --all --tags --prune
  git checkout "tags/${pkgver}" -b "${pkgver}"
}

package() {
  sudo make install PREFIX="${pkgdir}/usr" PYTHON="/usr/bin/env python3"
}
