# This script was originally based from Chocobo1 <chocobo1@archlinux.net>

pkgname="python3-nuitka"
pkgver="4.1.3"
gives="nuitka"
pkgdesc="Python compiler"
arch=('any')
url="https://nuitka.net/"
license=('Apache-2.0')
depends=(
  "libxml2 | libxml2-16"
  "libxslt1.1"
  "python3"
  "python3-ordered-set"
  "python3-pip"
  "python3-setuptools"
  "python3-tomli"
  "python3-wheel"
  "python3-yaml"
)
makedepends=(
  "git"
  "python3-build"
  "python3-installer"
  "python3-setuptools"
  "python3-wheel"
  "python3-tomli"
  "libxml2 | libxml2-16"
  "libxslt1.1"
)
optdepends=("chrpath: for building standalone executables")
provides=("${gives}")
conflicts=("${gives}")
source=("https://github.com/Nuitka/Nuitka/archive/refs/tags/${pkgver}.tar.gz")
maintainer=("aKqir24 <aKqir24@github.com>")

build() {
  cd "Nuitka-${pkgver}"

  python3 -m build --wheel --no-isolation
}

package() {
  cd "Nuitka-${pkgver}"

  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 Changelog.rst Developer_Manual.rst README.rst -t "${pkgdir}/usr/share/doc/nuitka"
}
