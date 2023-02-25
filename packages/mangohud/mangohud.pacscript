name="mangohud"
repology=("project: mangohud")
version="0.6.8"
url="https://github.com/flightlessmango/MangoHud/releases/download/v${version}/MangoHud-v${version}-Source.tar.xz"
build_depends="gcc g++ gcc-multilib g++-multilib meson ninja-build python3-pip python3-setuptools python3-wheel python3-mako pkg-config mesa-common-dev libx11-dev libxnvctrl-dev libdbus-1-dev glslang-tools"
description="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
hash="9c64ccab1a72ba1dc61cb88d2fbcce1d343fc6b6cdf22c2cc2859bfb2da66fd4"
maintainer="Henryws <hwengerstickel@pm.me>"

build() {
  sudo meson build --prefix="${pkgdir}/usr"
}

install() {
  sudo ninja -j"$(nproc)" -C build install
}
