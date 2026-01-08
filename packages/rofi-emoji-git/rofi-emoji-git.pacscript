pkgname="rofi-emoji-git"
pkgver="4.1.0"
gives="rofi-emoji"
pkgdesc="Rofi plugin for selecting emojis"
url='https://github.com/Mange/rofi-emoji'
arch=('x86_64')
license=("MIT")
checkdepends=("check")
depends=("rofi" "libc6" "libgcc-s1")
makedepends=(
  "pkg-config" "build-essential" "libglib2.0-dev"
  "libcairo2-dev" "libpango1.0-dev"
  "autoconf" "automake" "libtool" "bubblewrap")
conflicts=("${pkgname}" "${gives}")
replaces=("${gives}")
pacdeps=("rofi")
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/Mange/${gives}.git")

build() {
  cd "${gives}"
  autoreconf -i
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

check() {
  cd "${gives}"
  make check
}

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}/" install
  libtool --finish /usr/lib/rofi//
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
}
