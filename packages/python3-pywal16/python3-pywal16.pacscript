pkgname="python3-pywal16"
gives="pywal16"
pkgver="3.8.14"
pkgdesc="Generate and change color-schemes on the fly (fork that uses 16 colors)"
url='https://github.com/eylles/pywal16'
arch=('any')
license=('MIT')
depends=('python3' 'imagemagick')
maintainer=("aKqir24 <aKqir24@github.com>")
makedepends=(
  'git'
  'python3-setuptools'
)
provides=("${pkgname}" "pywal")
conflicts=("wal" "pywal")
optdepends=(
  "colorz: alternative color backend"
  "python-colorthief: alternative color backend"
  "fast-colorthief: alternative color backend (faster fork of colorthief)"
  "x11-xserver-utils: save colors to X db for new terminals to use"
  "bspwm: reload bspwm colors"
  "i3-wm: reload i3 colors"
  "kitty: reload kitty colors"
  "polybar: reload polybar colors"
  "sway: reload sway colors"
  "feh: set wallpaper for X (pywal's #1 choice)"
  "xwallpaper: set wallpaper for X (pywal's #2 choice)"
  "nitrogen: set wallpaper for X (pywal's #3 choice)"
  "hsetroot: set wallpaper for X (pywal's #4 choice)")
source=("https://github.com/eylles/${gives}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("7f56a7d00b1c0b9c5b44b846d83d0f7ad0b2c6c0c4e6f628d9c7381031743294")

build() {
  cd "${gives}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${gives}-${pkgver}"
  export PYTHONHASHSEED=0
  python3 setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
