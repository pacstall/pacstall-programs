pkgname="hyprland-bin"
pkgver="0.44.1"
gives="hyprland"
arch=("amd64")
conflicts=("hyprland")
depends=("libegl1" "libxcb-util1" "libxcb-render0" "libxcb-image0" "libxcb-icccm4" "libxcb-composite0" "libxcb-res0" "libxcb-ewmh2" "libwayland-cursor0" "libdisplay-info2" "libxkbcommon0" "libglib2.0-0" "libharfbuzz0b" "libpangocairo-1.0-0" "libinput10" "libseat-dev" "libliftoff0" "libopengl0" "libglx0" "libgles2" "libxcb-errors0" "libxcursor1" "libhyprcursor0")
# Oracular currently doesn't have a libhyprutils0 that is up to date with the SO file.
# Same for aquamarine, but they just don't have it upstream.
pacdeps=("libhyprutils-bin" "libaquamarine-bin")
compatible=("*:oracular" "*:devel" "debian:trixie" "debian:sid")
pkgdesc="A highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
source=("https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("4af254ce83f156df8a23c731f82b8879d015128b2185ae0b6a03c1b4caf49ec5")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: hyprland")

package() {
  cd "${_archive}"
  install -Dm755 ./Hyprland ./hyprctl ./hyprpm -t "${pkgdir}/usr/bin/"
  install -Dm644 ./assets/*.png ./example/hyprland.conf -t "${pkgdir}/usr/share/hyprland/"
  install -Dm644 ./example/hyprland.desktop "${pkgdir}/usr/share/wayland-sessions/hyprland.desktop"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hyprland/"
}
