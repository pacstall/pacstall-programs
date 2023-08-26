name="lemonbar-xft-git"
pkgver="0.0.1"
url="https://gitlab.com/protesilaos/lemonbar-xft"
makedepends=("build-essential" "libx11-dev" "libxft-dev" "libx11-xcb-dev" "libxcb-randr0-dev" "libxcb-xinerama0-dev")
breaks=("bar" "lemonbar")
pkgdesc="A lightweight xcb based bar with ported xft support."
hash="c2ca60846e0cade326969dd3f1f10e723f1a94d90d0335132b844932e41effff"
pkgver() {
  git ls-remote "${url}" xft-port | cut -f1 | cut -c1-8
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
