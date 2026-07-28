pkgname="noctalia-shell-git"
gives="noctalia"
source=("https://github.com/noctalia-dev/noctalia.git")
arch=("any")
pkgver="1.0.0"
makedepends=("just" "meson" "ninja-build" "git"
  "libwayland-dev" "wayland-protocols" "libfreetype-dev" "libfontconfig-dev"
  "libcairo2-dev" "libpango1.0-dev" "librsvg2-dev" "libxkbcommon-dev"
  "libepoxy-dev" "libgles-dev" "libwebp-dev" "libjxl-dev" "libcurl4-gnutls-dev"
  "libmd4c-dev" "nlohmann-json3-dev" "libsdbus-c++-dev" "libsecret-1-dev"
  "libsodium-dev" "libstb-dev" "libtomlplusplus-dev"
  "libpipewire-0.3-dev" "libpam0g-dev" "libpolkit-agent-1-dev"
  "libpolkit-gobject-1-dev" "libqalculate-dev" "libwireplumber-0.5-dev"
  "libxml2-dev")
depends=(
  "bash" "git" "pipewire" "libc6" "libcairo2"
  "libcurl3t64-gnutls" "libegl1" "libfontconfig1" "libfreetype6"
  "libgcc-s1" "libgles2" "libglib2.0-0t64" "libharfbuzz0b"
  "libjemalloc2" "libjxl0.11" "libmd4c0" "libpam0g"
  "libpango-1.0-0" "libpangocairo-1.0-0" "libpangoft2-1.0-0"
  "libpipewire-0.3-0t64" "libpolkit-agent-1-0" "libpolkit-gobject-1-0"
  "libqalculate23" "librsvg2-2" "libsdbus-c++2" "libsecret-1-0"
  "libsodium23" "libstdc++6" "libtomlplusplus3t64"
  "libwayland-client0" "libwayland-egl1" "libwebp7"
  "libwireplumber-0.5-0" "libxkbcommon0" "libxml2"
)
optdepends=(
  "libjemalloc-dev: reduces memory fragmentation in long-running sessions"
  "upower: power management integration"
  "wtype: virtual keyboard input"
  "ddcutil: monitor DDC/CI control"
)
pkgdesc="A sleek, customizable desktop shell crafted for Wayland"
maintainer=("AJStrong <ajstrongdev@pm.me>")
incompatible=('debian:stable')
external_connection=true

prepare() {
  cd "${gives}"
  just configure release
}

build() {
  cd "${gives}"
  just build release
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" meson install -C build-release
}
