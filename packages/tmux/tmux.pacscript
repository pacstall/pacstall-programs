pkgname="tmux"
arch=("any")
arch=("any")
pkgver="3.5"
source=("@${pkgname}~${pkgver}::https://github.com/tmux/tmux/releases/download/${pkgver}/tmux-${pkgver}.tar.gz")
makedepends=("gcc" "make" "pkg-config" "bison" "libncurses-dev" "libevent-dev" "libutempter-dev")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
replaces=("tmux")
pkgdesc="A terminal multiplexer"
sha256sums=("2fe01942e7e7d93f524a22f2c883822c06bc258a4d61dba4b407353d7081950f")
optdepends=("libutempter-dev: Record user sessions to utmp and wtmp files")
maintainer=("Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/tmux/LICENSE"
}
