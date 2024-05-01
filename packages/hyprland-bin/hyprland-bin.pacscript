pkgname="hyprland-bin"
pkgver="0.39.1"
gives="hyprland"
arch=("amd64")
replaces=("hyprland")
depends=("libegl1" "libxcb-util1" "libxcb-render0" "libxcb-image0" "libxcb-icccm4" "libxcb-composite0" "libxcb-res0" "libxcb-ewmh2" "libwayland-cursor0" "libdisplay-info1" "libxkbcommon0" "libglib2.0-0" "libharfbuzz0b" "libpangocairo-1.0-0" "libinput10" "libseat-dev" "libliftoff0" "libopengl0" "libglx0" "libgles2")
pacdeps=("hyprlang" "hyprcursor-bin" "xcb-util-errors")
compatible=("*:mantic" "*:noble" "*:devel" "debian:bookworm" "debian:trixie" "debian:sid")
pkgdesc="A highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
source=("https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=("1c7bd3eeb6f795d4c95b936397489ca55f7ec6951d7efdea069bd71540007f58")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: hyprland")

package() {
  cd "${_archive}"
    install -Dm755 ./Hyprland ./hyprctl ./hyprpm -t "${pkgdir}/usr/bin/"
    install -Dm644 ./assets/*.png ./example/hyprland.conf -t "${pkgdir}/usr/share/hyprland/"
    install -Dm644 ./example/hyprland.desktop "${pkgdir}/usr/share/wayland-sessions/hyprland.desktop"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hyprland/"
}
