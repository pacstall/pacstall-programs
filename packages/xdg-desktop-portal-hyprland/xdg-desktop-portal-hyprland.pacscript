pkgname="xdg-desktop-portal-hyprland"
repology=("project: ${pkgname}")
pkgver="1.2.5"
pkgrel="1"
protocols_ver="0.2"
source=(
  "https://github.com/hyprwm/${pkgname}/archive/v${pkgver}/v${pkgver}.tar.gz"
  "https://github.com/hyprwm/hyprland-protocols.git#branch=v${protocols_ver}"
)
sha256sums=(
  "c8ba3d173a580d8b4ec9a5ee15e7780d266e536a78a12aa28d8234e0854ae86d"
  "SKIP"
)
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
homepage='https://hyprland.org/'
pkgdesc="xdg-desktop-portal backend for hyprland"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=("amd64" "arm64")
depends=("pipewire" "xdg-desktop-portal" "grim" "slurp")
makedepends=("cmake" "pkg-config" "meson" "ninja-build" "scdoc" "wayland-utils" "wayland-protocols" "libgbm-dev" "libinih-dev" "uuid-dev" "qt6-base-dev" "qt6-wayland-dev" "libpipewire-0.3-dev" "libsdbus-c++-dev" "libsdbus-c++-bin")
case "${DISTRO}" in
  ubuntu:noble | ubuntu:devel | debian:sid) makedepends+=("libdrm-dev") ;;
  *) pacdeps+=('libdrm') ;;
esac

prepare() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/share/xdg-desktop-portal/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
}

build() {
  cd "${_archive}"
  echo '[preferred]
default=hyprland;gtk' | tee hyprland-portals.conf > /dev/null
  mkdir -p subprojects && cp -r "${srcdir}/hyprland-protocols" subprojects
  meson setup build
  ninja -C build
  make -j"${NCPU}" -C hyprland-share-picker all
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm0755 hyprland-share-picker/build/hyprland-share-picker -t "${pkgdir}/usr/bin/"
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  protocols_dir="${pkgdir}/usr/local/share/hyprland-protocols"
  if ! [[ -d ${protocols_dir} ]]; then
    mkdir -p "${protocols_dir}"
    cp -r subprojects/hyprland-protocols/protocols "${protocols_dir}"
    mkdir -p "${pkgdir}/usr/local/share/pkgconfig"
    echo "prefix=/usr/local
datarootdir=\${prefix}/share
pkgdatadir=\${pc_sysrootdir}\${datarootdir}/hyprland-protocols

Name: Hyprland Protocols
Description: Hyprland protocol files
Version: ${protocols_ver}" | tee "${pkgdir}/usr/local/share/pkgconfig/hyprland-protocols.pc" > /dev/null
  fi
}
