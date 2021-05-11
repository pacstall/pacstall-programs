name="soundux"
pkgname="soundux"
version="0.2.2b3"
url="https://github.com/Soundux/Soundux/releases/download/0.2.2_b3/soundux-0.2.2_b3.tar.gz"
build_depends="build-essential cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev"
depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio pulseaudio-utils"
description="A cross-platform soundboard"
hash="76c08786da00ad951a96c6f547a952bd0aa1fbaeac2a5f991bc6873355735777"
maintainer="Soundux developers <info@soundux.rocks>"

build() {
  mkdir -p build
  cd build
  cmake ..
  cmake --build . --config Release
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/soundux
}