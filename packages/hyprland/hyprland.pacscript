pkgname="hyprland"
repology=("project: hyprland")
pkgver="0.35.0"
source=("https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/source-v${pkgver}.tar.gz")
homepage='https://hyprland.org/'
makedepends=('meson' 'ninja-build' 'cmake-extras' 'cmake' 'gettext' 'gettext-base' 'libfontconfig-dev' 'libffi-dev' 'libxml2-dev' 'libxkbcommon-x11-dev' 'libxkbregistry-dev' 'libxkbcommon-dev' 'libpixman-1-dev' 'libudev-dev' 'libseat-dev' 'seatd' 'libxcb-dri3-dev' 'libvulkan-dev' 'libvulkan-volk-dev' 'libvkfft-dev' 'libgulkan-dev' 'libegl-dev' 'libgles2' 'libegl1-mesa-dev' 'glslang-tools' 'libinput-bin' 'libinput-dev' 'libxcb-composite0-dev' 'libavutil-dev' 'libavcodec-dev' 'libavformat-dev' 'libxcb-ewmh2' 'libxcb-ewmh-dev' 'libxcb-present-dev' 'libxcb-icccm4-dev' 'libxcb-render-util0-dev' 'libxcb-res0-dev' 'libxcb-xinput-dev' 'xdg-desktop-portal-wlr' 'fontconfig' 'libliftoff-dev' 'libdisplay-info-dev' 'libpango1.0-dev' 'libsystemd-dev' 'libgbm-dev' 'hwdata' 'xwayland' 'wayland-protocols' 'libwayland-dev' 'cpio' 'libtomlplusplus-dev')
case "${DISTRO}" in
  ubuntu:noble | ubuntu:devel) pacdeps+=('libtomlplusplus-header' 'xdg-desktop-portal-hyprland') makedepends+=('vulkan-utility-libraries-dev' 'libdrm-dev') ;;
  debian:sid) pacdeps+=('xdg-desktop-portal-hyprland') makedepends+=('vulkan-validationlayers-dev' 'libdrm-dev') ;;
  *) pacdeps+=('libtomlplusplus-header' 'libdrm') makedepends+=('vulkan-validationlayers-dev' 'xdg-desktop-portal-wlr') ;;
esac
optdepends=("kitty: default config terminal")
pkgdesc="Dynamic tiling Wayland compositor based on wlroots"
sha256sums=("de53d764606131c8aacc209f8a3ad6e619fdcddd16a7cdf4d8ca343816bb8c1b")
maintainer=("Elsie19 <elsie19@pm.me>")
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')

build() {
  cd "${_archive}"
  make all -j"${NCPU}" PREFIX="${pkgdir}/usr"
}

package() {
  cd "${_archive}"
  make install PREFIX="${pkgdir}/usr"
}
