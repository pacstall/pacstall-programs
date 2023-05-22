name="mangohud"
repology=("project: mangohud")
version="0.6.9-1"
url="https://github.com/flightlessmango/MangoHud/releases/download/v${version}/MangoHud-v${version}-Source.tar.xz"
homepage='https://github.com/flightlessmango/MangoHud'
build_depends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools")
description="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
hash="30d9336b60cbc7fdc2a1ba86ec62b9fb7f2986a2b0f6196ca347f5c13e583c6d"
incompatible=('debian:bullseye')
maintainer="Henryws <hwengerstickel@pm.me>"

build() {
  sudo meson build --prefix="${pkgdir}/usr"
}

install() {
  sudo ninja -j"${NCPU}" -C build install
}
