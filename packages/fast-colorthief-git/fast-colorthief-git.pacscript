pkgname="fast-colorthief-git"
gives="fast-colorthief"
pkgver="0.0.5"
pkgdesc="Selection of most dominant colors in image using Modified Median Cut Quantization "
arch=("any" "amd64")
url='https://github.com/bedapisl/fast-colorthief'
depends=(
  "python3"
  "python3-pil"
  "python3-numpy"
)
makedepends=(
  "cmake"
  "build-essential"
  "python3-dev"
  "python3-build"
  "python3-installer"
  "python3-wheel"
  "python3-setuptools"
)
conflicts=("${gives}" "${pkgname}")
provides=("${gives}")
source=("https://github.com/bedapisl/fast-colorthief.git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

build() {
  cd "${gives}"
  git submodule update --init --recursive
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
