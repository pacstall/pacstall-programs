# This script was originally based from Chocobo1 <chocobo1@archlinux.net>

pkgname="nuitka-git"
pkgver="2.4.6.r61.g58d849260"
pkgrel="1"
pkgdesc="A Python compiler"
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
provides=("nuitka")
conflicts=("nuitka")
source=("git+https://github.com/Nuitka/Nuitka.git")
sha256sums=('SKIP')
maintainer=("aKqir24 <aKqir24@github.com>")

pkgver() {
  cd "Nuitka"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "${_tag}"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${_tag}" "${_rev}" "${_hash}" | sed 's/^v//'
}

build() {
  cd "Nuitka"

  python3 \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "Nuitka"

  python3 \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 Changelog.rst Developer_Manual.rst README.rst -t "${pkgdir}/usr/share/doc/nuitka"
}
