name="picom"
gives="picom"
pkgver="10.2"
pkgdesc="A lightweight compositor for X11"
repology=("project: picom")
arch=("amd64")
replace=("compton" "${gives}")
breaks=("ibhagwan-${gives}-git" "jonaburg-${gives}-git" "${gives}-git")
depends=("libconfig-dev" "libdbus-1-dev" "libegl-dev" "libev-dev" "libevdev-dev" "libgl-dev" "libpcre2-dev" "libpixman-1-dev" "libx11-xcb-dev" "libxcb1-dev" "libxcb-composite0-dev" "libxcb-damage0-dev" "libxcb-dpms0-dev" "libxcb-glx0-dev" "libxcb-image0-dev" "libxcb-present-dev" "libxcb-randr0-dev" "libxcb-render0-dev" "libxcb-render-util0-dev" "libxcb-shape0-dev" "libxcb-util-dev" "libxcb-xinerama0-dev" "libxcb-xfixes0-dev" "libxext-dev" "ninja-build" "xserver-xorg")
makedepends=("meson" "uthash-dev")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/yshui/${gives}/archive/refs/tags/v${pkgver}.tar.gz"
hash="9741577df0136d8a2be48005ca2b93edc15913528e19bceb798535ca4683341c"

prepare() {
  meson setup build --buildtype=release --prefix=/usr
}

build() {
  ninja -C build -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
  sudo install -Dm644 "${gives}.sample.conf" "${pkgdir}/etc/xdg/${gives}.conf.example"
}

post_install() {
  fancy_message info "To configure Picom, copy the example config file from /etc/xdg/${gives}.conf.example to ~/.config/${gives}/ and rename it to ${gives}.conf"
}
