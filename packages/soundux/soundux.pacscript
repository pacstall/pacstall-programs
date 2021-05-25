name="soundux"
pkgname="soundux"
version="0.2.6"
url="https://github.com/Soundux/Soundux/releases/download/0.2.6/soundux-0.2.6.tar.gz"
build_depends="build-essential cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev"
depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio pulseaudio-utils"
description="A cross-platform soundboard"
hash="0cffff520b3d1e69ccbb10599ff1ff3c911d74eb01a4af8dc3d5132fa5535c63"
maintainer="Soundux developers <info@soundux.rocks>"
pacdeps=("pipewire-git")

prepare() {
    true
}

build() {
  mkdir -p build
  cd build
  cmake ..
  cmake --build . --config Release -j$(nproc)
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/soundux
}
