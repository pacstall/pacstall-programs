pkgname="git-review"
repology=("project: git-review")
pkgver="2.5.0"
pkgdesc="Tool to submit code to Gerrit"
arch=('any')
url='https://opendev.org/opendev/git-review'
license=('Apache-2.0')
depends=(
  "git"
  "python3-requests"
)
makedepends=(
  "python3-build"
  "python3-installer"
  "python3-pbr"
  "python3-setuptools"
  "python3-wheel"
)
source=("https://opendev.org/opendev/git-review.git#tag=${pkgver}")
sha256sums=('80dd10ea2f43036ac61a4618335e413d99dd6ea1af7bb424011c277218fc7e7b')
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")

build() {
  cd "${pkgname}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 git-review.1 -t "${pkgdir}/usr/share/man/man1/"
}
