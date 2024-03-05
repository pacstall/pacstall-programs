name="tmux"
pkgver="3.3"
source=("https://github.com/tmux/tmux/releases/download/${pkgver}/tmux-${pkgver}.tar.gz")
makedepends=("gcc" "make" "pkg-config" "bison" "libncurses-dev" "libevent-dev")
breaks=("${name}-git" "${name}-bin" "${name}-deb" "${name}-app")
replaces=("tmux")
pkgdesc="A terminal multiplexer"
hash=("b2382ac391f6a1c5b93293016cdc9488337d9a04b9d611ae05eac164740351dc")
optdepends=("libutempter-dev: Record user sessions to utmp and wtmp files")
maintainer="Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>"

build() {
  # Check if `libutempter-dev` ( optdepends ) is installed
  if dpkg-query -W libutempter-dev > /dev/null 2>&1; then
    ./configure --enable-utempter
  else
    ./configure
  fi
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm755 example_tmux.conf "${pkgdir}/usr/share/tmux/example_tmux.conf"
  sudo install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/tmux/LICENSE"
}
