pkgname="yle-dl-git"
gives="yle-dl"
repology=("project: ${gives}")
arch=('any')
pkgver="20250730"
url='https://aajanki.github.io/yle-dl/index.html'
source=("https://github.com/aajanki/yle-dl.git"
  "flit-3.9-license-format.patch")
sha256sums=("SKIP" "963db0531c9be7d009e7544e95481ab2f1d92059b44d02c9e38407187e065893")
depends=("python3-requests"
  "python3-lxml"
  "python3-configargparse"
  "python3-psutil"
  "python3-xattr"
  "ffmpeg")
recommends=("wget")
makedepends=(
  "python3-build"
  "python3-installer"
  "flit"
)
pkgdesc="Download videos from Yle Areena"
maintainer=("pejuton <pejuton@proton.me>")
license=('GPL-3.0-or-later')

prepare() {
  cd "${gives}"

  # Support pyproject.toml license expression format with Flit versions older than 3.11
  flit_version="$(dpkg-query --showformat='${Version}' --show flit)"

  if dpkg --compare-versions "${flit_version}" "lt" "3.11.0"; then
    patch --verbose -p1 -i "${srcdir}/flit-3.9-license-format.patch"
  fi
}

check() {
  cd "${gives}"
  python3 -m pytest tests/unit
}

build() {
  cd "${gives}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
