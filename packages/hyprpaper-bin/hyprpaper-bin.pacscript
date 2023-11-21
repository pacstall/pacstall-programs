name="hyprpaper-bin"
repology=("project: hyprpaper")
pkgver="0.4.0"
url="https://github.com/hyprwm/hyprpaper/releases/download/v${pkgver}/v${pkgver}.tar.gz"
hash="654d436389c4f3f1a28cc6424286081e33f3832b5ff60380028b60d737e46a1c"
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
homepage='https://hyprland.org/'
pkgdesc="Wayland wallpaper utility with IPC controls"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 ./hyprpaper -t "${pkgdir}/usr/bin"
}
