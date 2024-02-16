name="picom"
homepage='https://github.com/yshui/picom'
pkgver="11.2"
pkgdesc="A lightweight compositor for X11"
repology=("project: ${name}")
replace=("${name}")
breaks=("compton" "${name}-git" "ibhagwan-${name}-git" "jonaburg-${name}-git")
makedepends=(
  "libconfig-dev" "libdbus-1-dev" "libegl-dev"
  "libepoxy-dev" "libev-dev" "libgl-dev" "libpcre2-dev"
  "libpixman-1-dev" "libx11-xcb-dev" "libxcb1-dev"
  "libxcb-composite0-dev" "libxcb-damage0-dev"
  "libxcb-dpms0-dev" "libxcb-glx0-dev"
  "libxcb-image0-dev" "libxcb-present-dev"
  "libxcb-randr0-dev" "libxcb-render0-dev"
  "libxcb-render-util0-dev" "libxcb-shape0-dev"
  "libxcb-util-dev" "libxcb-xfixes0-dev"
  "libxext-dev" "meson" "ninja-build" "uthash-dev"
)
depends=(
  "libconfig9" "libdbus-1-3" "libegl1" "libepoxy0"
  "libev4" "libgl1" "libpcre2-8-0" "libpixman-1-0"
  "libx11-6" "libx11-xcb1" "libxcb-composite0"
  "libxcb-damage0" "libxcb-glx0" "libxcb-image0"
  "libxcb-present0" "libxcb-randr0"
  "libxcb-render-util0" "libxcb-render0"
  "libxcb-shape0" "libxcb-sync1" "libxcb-xfixes0"
  "libxcb1"
)
optdepends=(
  "dbus: for controlling picom via D-Bus"
  "python3: for running picom-convgen.py"
  "x11-utils: for picom-trans"
)
url="https://github.com/yshui/picom/archive/refs/tags/v${pkgver}.tar.gz"
hash="1c1063936faf09ed9bba726e7737a562564b7a5f8cdef79d48fcdaf3669a4df4"
maintainer="vigress8 <vig@disroot.org>"

prepare() {
  meson setup -Dprefix="${pkgdir}/usr" --buildtype=release . build
}

build() {
  ninja -C build
}

package() {
  sudo ninja -C build install
}
