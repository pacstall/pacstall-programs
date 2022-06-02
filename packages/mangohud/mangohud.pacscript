name="mangohud"
version="0.6.7-1"
url="https://github.com/flightlessmango/MangoHud/releases/download/v${version}/MangoHud-v${version}-Source.tar.xz"
depends="gcc g++ gcc-multilib g++-multilib meson ninja-build python3-pip python3-setuptools python3-wheel python3-mako pkg-config mesa-common-dev libx11-dev libxnvctrl-dev libdbus-1-dev glslang-tools"
hash="5f925a537e611d898db608dd93155ce3c4137326b21376c7d34333181e3da959"
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
