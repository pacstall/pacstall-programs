pkgname="rofi-emoji"
pkgver="3.5.0"
pkgdesc="Rofi plugin for selecting emojis"
url='https://github.com/Mange/rofi-emoji'
arch=('x86_64')
license=("MIT")
checkdepends=('check')
depends=('libc6' 'libgcc-s1' 'rofi<=1.7.6')
makedepends=('pkg-config' 'build-essential' 'rofi-dev'
  'libglib2.0-dev' 'libcairo2-dev' 'libpango1.0-dev'
  'autoconf' 'automake' 'libtool' 'rofi<=1.7.6')
optdepends=("xsel: Clipboard interaction under X11"
  "xclip: Clipboard interaction under X11"
  "wl-clipboard: Clipboard interaction under Wayland")
provides=("${pkgname}")
conflicts=("${pkgname}")
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/Mange/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  libtool --finish /usr/lib/x86_64-linux-gnu/rofi//
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
