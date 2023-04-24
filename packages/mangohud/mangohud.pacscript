name="mangohud"
repology=("project: mangohud")
version="0.6.9"
url="https://github.com/flightlessmango/MangoHud/releases/download/v${version}/MangoHud-v${version}-Source.tar.xz"
homepage='https://github.com/flightlessmango/MangoHud'
build_depends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools")
description="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
hash="a6e59ad810a30cd0a6a62ac5a7b5d8a10abab48eb1312e084ca7c81472d76573"
incompatible=('debian:bullseye')
maintainer="Henryws <hwengerstickel@pm.me>"

build() {
  sudo meson build --prefix="${pkgdir}/usr"
}

install() {
  sudo ninja -j"$(nproc)" -C build install
}
