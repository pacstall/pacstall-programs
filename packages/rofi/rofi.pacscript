pkgbase="rofi"
pkgname=("rofi" "rofi-dev")
pkgver="1.7.9.1"
arch=("any")
url='https://github.com/davatorium/rofi'
license=("MIT")
pkgdesc="A window switcher, application launcher, and dmenu replacement."
depends=(
  "libcairo2"
  "libgdk-pixbuf-2.0-0"
  "libglib2.0-0>=2.72"
  "libpango-1.0-0>=1.50"
  "libpangocairo-1.0-0"
  "libstartup-notification0>=0.11"
  "libxcb-cursor0"
  "libxcb-ewmh2"
  "libxcb-icccm4"
  "libxcb-randr0"
  "libxcb-util1"
  "libxcb-xinerama0"
  "libxcb-xkb1"
  "libxcb1"
  "libxkbcommon-x11-0"
  "libxkbcommon0>=0.4.1"
)
makedepends=(
  "bison"
  "flex>=2.5.39"
  "libcairo2-dev"
  "libgdk-pixbuf-2.0-dev"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libstartup-notification0-dev"
  "libxcb-cursor-dev"
  "libxcb-ewmh-dev"
  "libxcb-icccm4-dev"
  "libxcb-keysyms1-dev"
  "libxcb-randr0-dev"
  "libxcb-util-dev"
  "libxcb-xinerama0-dev"
  "libxcb-xkb-dev"
  "libxcb1-dev"
  "libxkbcommon-dev"
  "libxkbcommon-x11-dev"
  "pandoc"
  "pkg-config"
)
checkdepends=(
  "check"
)
source=("@${pkgbase}~${pkgver}::https://github.com/davatorium/rofi/releases/download/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=("bb2c0f073b4422acc51a3f97d05275a82464750a33d2f4b120e3d866bb7b9ae5")
maintainer=("Don Alfons <donnisnoni@outlook.com>")

prepare() {
  cd "${pkgbase}~${pkgver}"
  ./configure --prefix=/usr
}

build() {
  cd "${pkgbase}~${pkgver}"
  make -j"${NCPU}"
}

check() {
  cd "${pkgbase}~${pkgver}"
  make -j"${NCPU}" check
}

package_rofi() {
  pkgdesc="A window switcher, application launcher, and dmenu replacement"
  depends=("${depends[@]}")

  cd "${pkgbase}~${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir:?}/usr/include/rofi"
  rm -f "${pkgdir:?}/usr/lib/pkgconfig/rofi.pc"
}

package_rofi-dev() {
  pkgdesc="Development files for rofi"

  cd "${pkgbase}~${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir:?}/usr/bin"
  rm -rf "${pkgdir:?}/usr/share"
  rm -rf "${pkgdir:?}/usr/lib/rofi"
}
