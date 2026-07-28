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
optdepends=("libjemalloc-dev: reduces memory fragmentation in long-running sessions")
pkgdesc="A sleek, customizable desktop shell crafted for Wayland"
maintainer=("AJStrong <ajstrongdev@pm.me>")
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
