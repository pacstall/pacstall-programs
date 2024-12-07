pkgname="youtube-dl-git"
gives="youtube-dl"
source=("https://github.com/ytdl-org/youtube-dl.git")
arch=("all")
pkgver="2021.12.17"
pkgdesc="Command-line program to download videos from YouTube.com and other video sites"
makedepends=("make" "pandoc" "python3")
depends=("python3")
maintainer=("KwonNam Son <kwon37xi@gmail.com>")

prepare() {
  cd "youtube-dl"
  git fetch --all --tags --prune
  git checkout "tags/${pkgver}" -b "${pkgver}"
}

package() {
  cd "youtube-dl"
  make install PREFIX="${pkgdir}/usr" PYTHON="/usr/bin/env python3"
}
