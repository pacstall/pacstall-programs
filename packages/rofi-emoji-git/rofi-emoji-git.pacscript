pkgname="rofi-emoji-git"
pkgver="4.1.0"
gives="rofi-emoji"
pkgdesc="Rofi plugin for selecting emojis"
url='https://github.com/Mange/rofi-emoji'
arch=('x86_64')
license=("MIT")
checkdepends=("check")
makedepends=(
  "autoconf"
  "automake"
  "libtool"
  "libtool-bin"
  "bubblewrap"
)

optdepends=(
  "xsel: Clipboard interaction under X11"
  "xclip: Clipboard interaction under X11"
  "wl-clipboard: Clipboard interaction under Wayland"
  "rofi-wayland: For wayland only support in rofi"
  "rofi-x11: For x11 only support in rofi"
)

provides=("${pkgname}" "${gives}")
conflicts=("${gives}")
replaces=("${gives}")
pacdeps=("rofi")
maintainer=("aKqir24 <aKqir24@github.com>")
source=("https://github.com/Mange/${gives}.git")

pre_install() {
  mkdir -p /usr/src/pacstall/rofi-emoji-git/DEBIAN/
  touch /usr/src/pacstall/rofi-emoji-git/DEBIAN/control # A work around to a bug in pacstall
}

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
