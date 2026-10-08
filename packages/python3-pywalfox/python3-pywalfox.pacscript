#  This script was originally based from Fredrik Engstrand <fredrik@engstrand.nu>

pkgname="python-pywalfox"
gives="pywalfox"
pkgver="2.9.0"
pkgdesc="Native app used alongside the Pywalfox browser extension"
arch=('any')
url='https://github.com/frewacom/pywalfox'
license=('MPL-2.0')
maintainer=("aKqir24 <aKqir24@github.com>")
depends=("python3")
makedepends=("python3" "python3-setuptools")
source=("https://pypi.python.org/packages/source/p/${gives}/${gives}-${pkgver}.tar.gz")
sha256sums=("8a0dee4f7adfa78609314905f245e5da1bb4d7f0d1cae7a3da56c4e284dd3501")

prepare() {
  cd "${gives}-${pkgver}"
  local site_packages
  site_packages="$(python3 -c "import site; print(site.getsitepackages()[0])")"
  sed -i "s:<path>:${site_packages}/pywalfox/bin/main.sh:" pywalfox/assets/manifest.json
}

build() {
  cd "${gives}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${gives}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 pywalfox/assets/manifest.json -T "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/pywalfox.json"
}
