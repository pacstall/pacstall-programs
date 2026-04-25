pkgname="yle-dl-git"
gives="yle-dl"
repology=("project: ${gives}")
arch=('any')
pkgver="20250730"
url='https://aajanki.github.io/yle-dl/index.html'
source=("https://github.com/aajanki/yle-dl.git")
sha256sums=("SKIP")
depends=("python3-requests"
  "python3-lxml"
  "python3-configargparse"
  "python3-psutil"
  "python3-xattr"
  "ffmpeg")
recommends=("wget")
makedepends=("python3-build" "python3-installer")
pkgdesc="Download videos from Yle Areena"
maintainer=("pejuton <pejuton@proton.me>")
license=('GPL-3.0-or-later')

build() {
  cd "${gives}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
