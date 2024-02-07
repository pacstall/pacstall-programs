name="vivarium"
pkgver="0.0.4"
hash="abb7272f53d1769de3726c6961df40627c98b8884eb32388e29b8812c60aacec"
url="https://github.com/inclement/vivarium/archive/refs/tags/v${pkgver}.zip"
pkgdesc="A dynamic tiling Wayland compositor using wlroots, with desktop semantics inspired by xmonad"
makedepends=("meson" "libwlroots-dev" "xcb" "libseat-dev" "libxcb-res0-dev")
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  meson build
  ninja -C build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
