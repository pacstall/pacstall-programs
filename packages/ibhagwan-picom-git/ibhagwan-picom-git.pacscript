name="ibhagwan-picom-git"
gives="ibhagwan-picom"
url="https://github.com/ibhagwan/picom.git"
pkgver="7.5"
license="MIT,MPL-2.0"
depends=("libxext-dev" "libxcb1-dev" "libxcb-damage0-dev" "libxcb-xfixes0-dev" "libxcb-shape0-dev" "libxcb-render-util0-dev" "libxcb-render0-dev" "libxcb-randr0-dev" "libxcb-composite0-dev" "libxcb-image0-dev" "libxcb-present-dev" "libxcb-xinerama0-dev" "libxcb-glx0-dev" "libpixman-1-dev" "libdbus-1-dev" "libconfig-dev" "libgl1-mesa-dev" "libpcre2-dev" "libpcre3-dev" "libevdev-dev" "uthash-dev" "libev-dev" "libx11-xcb-dev" "meson" "curl")
pkgdesc="A compositor, which is a fork of Sandmark's picom branch, including tryone's dual_kawase blur with rounded corners and blurring on all backends"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
breaks="compton picom"
pkgver() {
  git ls-remote "${url}" next-rebase | cut -f1 | cut -c1-8
}

prepare() {
  git submodule update --init --recursive
  meson --buildtype=release . build
  meson configure build
}

build() {
  ninja -C build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
