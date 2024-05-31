pkgname="hyprland-bin"
pkgver="0.40.0"
pkgrel="2"
gives="hyprland"
arch=("amd64")
conflicts=("hyprland")
depends=("libegl1" "libxcb-util1" "libxcb-render0" "libxcb-image0" "libxcb-icccm4" "libxcb-composite0" "libxcb-res0" "libxcb-ewmh2" "libwayland-cursor0" "libdisplay-info1" "libxkbcommon0" "libglib2.0-0" "libharfbuzz0b" "libpangocairo-1.0-0" "libinput10" "libseat-dev" "libliftoff0" "libopengl0" "libglx0" "libgles2")
compatible=("*:mantic" "*:noble" "*:devel" "debian:bookworm" "debian:trixie" "debian:sid")
pkgdesc="A highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
source=("https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("746ac771c7675163b40b5fb989e0a8aabd8d1a18a63aaf228d2bd0af2e0ff3d1")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: hyprland")

package() {
  cd "${_archive}"
  install -Dm755 ./Hyprland ./hyprctl ./hyprpm -t "${pkgdir}/usr/bin/"
  install -Dm644 ./assets/*.png ./example/hyprland.conf -t "${pkgdir}/usr/share/hyprland/"
  install -Dm644 ./example/hyprland.desktop "${pkgdir}/usr/share/wayland-sessions/hyprland.desktop"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hyprland/"
}
