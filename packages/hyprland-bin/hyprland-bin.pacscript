name="hyprland-bin"
pkgver="0.39.0"
gives="hyprland"
arch=("amd64")
breaks=("hyprland")
replace=("hyprland")
depends=("libegl1" "libxcb-util1" "libxcb-render0" "libxcb-image0" "libxcb-icccm4" "libxcb-composite0" "libxcb-res0" "libxcb-ewmh2" "libwayland-cursor0" "libdisplay-info1" "libxkbcommon0" "libglib2.0-0" "libharfbuzz0b" "libpangocairo-1.0-0" "libinput10" "libseat-dev" "libliftoff0" "libopengl0" "libglx0" "libgles2")
pacdeps=("hyprlang" "hyprcursor-bin" "xcb-util-errors")
incompatible=("ubuntu:jammy")
pkgdesc="A highly customizable dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
url="https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz"
hash="fdd5f22582088724cfe9f3541f5bfad54ed2c855869644383590faf9b9ae3717"
repology=("project: hyprland")

package() {
    sudo install -Dm755 ./Hyprland ./hyprctl ./hyprpm -t "${pkgdir}/usr/bin/"
    sudo install -Dm644 ./assets/*.png ./example/hyprland.conf -t "${pkgdir}/usr/share/hyprland/"
    sudo install -Dm644 ./example/hyprland.desktop "${pkgdir}/usr/share/wayland-sessions/hyprland.desktop"
    sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hyprland/"
}
