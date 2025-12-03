pkgname="colorz-git"
gives="colorz"
pkgver="1.0.3"
pkgdesc="k-means color scheme generator"
arch=("any")
url='https://github.com/metakirby5/colorz'
license=("MIT")
depends=(
  "python3"
  "python3-pil"
  "python3-scipy"
)
makedepends=(
  "build-essential"
  "python3-dev"
  "python3-build"
  "python3-installer"
  "python3-wheel"
  "python3-setuptools"
)
provides=("${gives}")
source=("https://github.com/metakirby5/colorz.git")
maintainer=("aKqir24 <aKqir24@github.com>")

build() {
  cd "${gives}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
