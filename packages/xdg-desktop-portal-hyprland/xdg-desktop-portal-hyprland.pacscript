name="xdg-desktop-portal-hyprland"
repology=("project: ${name}")
pkgver="1.2.5"
pkgrel="1"
url="https://github.com/hyprwm/${name}/archive/v${pkgver}/v${pkgver}.tar.gz"
protocols_url="https://github.com/hyprwm/hyprland-protocols.git"
hash="c8ba3d173a580d8b4ec9a5ee15e7780d266e536a78a12aa28d8234e0854ae86d"
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
homepage='https://hyprland.org/'
pkgdesc="xdg-desktop-portal backend for hyprland"
maintainer="Elsie19 <elsie19@pm.me>"
arch=("amd64" "arm64")
depends=("pipewire" "xdg-desktop-portal" "grim" "slurp")
makedepends=("cmake" "pkg-config" "meson" "ninja-build" "scdoc" "wayland-utils" "wayland-protocols" "libgbm-dev" "libdrm-dev" "libinih-dev" "uuid-dev" "qt6-base-dev" "qt6-wayland-dev" "libpipewire-0.3-dev" "libsdbus-c++-dev" "libsdbus-c++-bin")

prepare() {
    sudo mkdir -p "${pkgdir}/usr/share/xdg-desktop-portal/"
    sudo mkdir -p "${pkgdir}/usr/bin/"
    sudo mkdir -p "${pkgdir}/usr/share/licenses/${name}/"
}

build() {
    echo '[preferred]
default=hyprland;gtk' | tee hyprland-portals.conf > /dev/null
    mkdir -p subprojects && cd subprojects
    git clone --quiet --depth=1 --jobs=10 "${protocols_url}" && cd ..
    meson setup build
    ninja -C build
    make -j"${NCPU}" -C hyprland-share-picker all
}

package() {
    sudo DESTDIR="${pkgdir}" ninja -C build install
    sudo install -Dm0755 hyprland-share-picker/build/hyprland-share-picker -t "${pkgdir}/usr/bin/"
    sudo install -Dm0644 "hyprland-portals.conf" -t "${pkgdir}/usr/share/xdg-desktop-portal/"
    sudo install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}/"
}
