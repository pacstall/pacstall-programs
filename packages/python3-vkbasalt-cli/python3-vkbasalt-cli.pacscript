pkgname="python3-vkbasalt-cli"
pkgver="3.1.1"
pkgdesc="Command-line utility for vkBasalt"
arch=("any")
url='https://gitlab.com/TheEvilSkeleton/vkbasalt-cli'
license=("LGPL-3.0-or-later")
depends=("python3")
makedepends=(
  "git"
  "python3-build"
  "python3-wheel"
  "python3-installer"
  "python3-setuptools"
)
source=("${url}/-/archive/v${pkgver}/vkbasalt-cli-v${pkgver}.tar.gz")
sha256sums=("a2368f8bb5856b0cbb15d8a5c6010225f087143242f92a311c6a95cfb877f438")

build() {
  cd "vkbasalt-cli-v${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "vkbasalt-cli-v${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
