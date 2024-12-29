pkgname="tmux"
arch=("any")
arch=("any")
pkgver="3.3"
source=("@${pkgname}~${pkgver}::https://github.com/tmux/tmux/releases/download/${pkgver}/tmux-${pkgver}.tar.gz")
makedepends=("gcc" "make" "pkg-config" "bison" "libncurses-dev" "libevent-dev")
breaks=("${pkgname}-git" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
replaces=("tmux")
pkgdesc="A terminal multiplexer"
sha256sums=("b2382ac391f6a1c5b93293016cdc9488337d9a04b9d611ae05eac164740351dc")
optdepends=("libutempter-dev: Record user sessions to utmp and wtmp files")
maintainer=("Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>")

build() {
  cd "${pkgname}~${pkgver}"
  # Check if `libutempter-dev` ( optdepends ) is installed
  if dpkg-query -W libutempter-dev > /dev/null 2>&1; then
    ./configure --enable-utempter
  else
    ./configure
  fi
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/tmux/LICENSE"
}
