pkgname="lemonbar-xft-git"
arch=("any")
pkgver="0.0.1"
source=("git+https://gitlab.com/protesilaos/lemonbar-xft")
makedepends=("build-essential" "libx11-dev" "libxft-dev" "libx11-xcb-dev" "libxcb-randr0-dev" "libxcb-xinerama0-dev")
breaks=("bar" "lemonbar")
pkgdesc="A lightweight xcb based bar with ported xft support."
sha256sums=("c2ca60846e0cade326969dd3f1f10e723f1a94d90d0335132b844932e41effff")

build() {
  cd "lemonbar-xft"
  make -j"${NCPU}"
}

package() {
  cd "lemonbar-xft"
  make install DESTDIR="${pkgdir}"
}
