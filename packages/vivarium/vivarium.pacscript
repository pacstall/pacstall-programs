name="vivarium"
version="0.0.4"
hash="abb7272f53d1769de3726c6961df40627c98b8884eb32388e29b8812c60aacec"
url="https://github.com/inclement/vivarium/archive/refs/tags/v${version}.zip"
description="A dynamic tiling Wayland compositor using wlroots, with desktop semantics inspired by xmonad"
build_depends="meson libwlroots-dev xcb libseat-dev libxcb-res0-dev"

prepare() {
  true
}

build() {
  meson build
  ninja -C build
}

install() {
  sudo DESTDIR=/usr/src/pacstall/vivarium ninja -C build install
}
# vim:set ft=sh ts=2 sw=2 et:
