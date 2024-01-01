name="hyprland"
repology=("project: hyprland")
pkgver="0.34.0"
url="https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/source-v${pkgver}.tar.gz"
homepage='https://hyprland.org/'
makedepends=('meson' 'ninja-build' 'cmake-extras' 'cmake' 'gettext' 'gettext-base' 'libfontconfig-dev' 'libffi-dev' 'libxml2-dev' 'libxkbcommon-x11-dev' 'libxkbregistry-dev' 'libxkbcommon-dev' 'libpixman-1-dev' 'libudev-dev' 'libseat-dev' 'seatd' 'libxcb-dri3-dev' 'libvulkan-dev' 'libvulkan-volk-dev' 'vulkan-validationlayers-dev' 'libvkfft-dev' 'libgulkan-dev' 'libegl-dev' 'libgles2' 'libegl1-mesa-dev' 'glslang-tools' 'libinput-bin' 'libinput-dev' 'libxcb-composite0-dev' 'libavutil-dev' 'libavcodec-dev' 'libavformat-dev' 'libxcb-ewmh2' 'libxcb-ewmh-dev' 'libxcb-present-dev' 'libxcb-icccm4-dev' 'libxcb-render-util0-dev' 'libxcb-res0-dev' 'libxcb-xinput-dev' 'xdg-desktop-portal-wlr' 'fontconfig' 'libliftoff-dev' 'libdisplay-info-dev' 'libpango1.0-dev' 'libsystemd-dev' 'libgbm-dev' 'hwdata' 'xwayland' 'wayland-protocols' 'libwayland-dev' 'cpio')
pacdeps=('libtomlplusplus-header' 'libdrm' 'xdg-desktop-portal-hyprland')
optdepends=("kitty: default config terminal")
pkgdesc="Dynamic tiling Wayland compositor based on wlroots"
hash="234500dc726ec6cd190d95d45cf6d04766064172e75c1351ee7c49ec3405497e"
maintainer="Elsie19 <elsie19@pm.me>"
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')

build() {
  make all -j"${NCPU}" PREFIX="${pkgdir}/usr"
}

package() {
  sudo make install PREFIX="${pkgdir}/usr"
}
