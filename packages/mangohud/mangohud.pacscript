name="mangohud"
version="0.6.5"
url="https://github.com/flightlessmango/MangoHud/releases/download/v0.6.5/MangoHud-v0.6.5-Source.tar.xz"
depends="gcc g++ gcc-multilib g++-multilib ninja-build python3-pip python3-setuptools python3-wheel pkg-config mesa-common-dev libx11-dev libxnvctrl-dev libdbus-1-dev glslang-tools"
hash="aa3f65ece217842c3be1b755c0f3a09b2096f0af475715d3619182a13c6f4fbf"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  true  
}

build() {
  meson build --prefix=/usr/src/pacstall/mangohud/usr
}

install() {
  ninja -j$(nproc) -C build install
}
