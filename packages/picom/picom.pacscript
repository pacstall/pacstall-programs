pkgname="picom"
url='https://github.com/yshui/picom'
pkgver="12.1"
pkgdesc="A lightweight compositor for X11"
repology=("project: ${pkgname}")
replaces=("${pkgname}")
breaks=("compton" "${pkgname}-git" "ibhagwan-${pkgname}-git" "jonaburg-${pkgname}-git")
makedepends=(
  "cmake" "libdbus-1-dev" "libegl-dev"
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
  "libdbus-1-3" "libegl1" "libepoxy0"
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
source=("https://github.com/yshui/picom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d1aab4277e3a123c41621fa57c1ed66cc4a6553174a69e259d3027cf984c452c")
maintainer=("vigress8 <vig@disroot.org>")
external_connection='true'

prepare() {
  cd "${_archive}"
  meson setup -Dprefix="${pkgdir}/usr" --buildtype=release . build
}

build() {
  cd "${_archive}"
  ninja -C build
}

package() {
  cd "${_archive}"
  ninja -C build install
}
