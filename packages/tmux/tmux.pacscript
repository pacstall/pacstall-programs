pkgname="tmux"
arch=("any")
arch=("any")
pkgver="3.7c"
repology=("project: ${pkgname}")
source=("@${pkgname}~${pkgver}::https://github.com/tmux/tmux/releases/download/${pkgver}/tmux-${pkgver}.tar.gz")
makedepends=("gcc" "make" "pkg-config" "bison" "libncurses-dev" "libevent-dev" "libutempter-dev")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
replaces=("tmux")
pkgdesc="A terminal multiplexer"
sha256sums=("7c60cae9a0e25288e2e24750aafc9e8800fc7fd4555e447e1b29ee4201cfb3bf")
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
