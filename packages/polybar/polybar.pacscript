name="polybar"
pkgname="polybar"
version="3.6.3"
url="https://github.com/polybar/polybar/releases/download/${version}/polybar-${version}.tar.gz"
build_depends="cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev"
description="Polybar aims to help users build beautiful and highly customizable status bars for their desktop environment, without the need of having a black belt in shell scripting"
maintainer="Henryws <hwengerstickel@pm.me>"
hash="f25758573567208fc7b6f4d4115a6117a87389cbcc094cf605d079775be95fa5"
optdepends=("libxcb-xkb-dev: xkeyboard"
  "libxcb-xrm-dev: xrdb"
  "libxcb-cursor-dev: cursorclick/scroll"
  "libasound2-dev: alsa"
  "libpulse-dev: pulseaudio"
  "libjsoncpp-dev: json"
  "libmpdclient-dev: mpd"
  "libcurl4-openssl-dev: github"
  "libnl-genl-3-dev: network")

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/polybar
}
