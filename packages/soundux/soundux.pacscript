name="soundux"
pkgname="soundux"
version="0.2.3"
url="https://github.com/Soundux/Soundux/releases/download/0.2.3/soundux-0.2.3.tar.gz"
build_depends="build-essential cmake libx11-dev libxi-dev libwebkit2gtk-4.0-dev libappindicator3-dev libssl-dev libpulse-dev"
depends="libgtk-3-0 libwnck-3-0 libappindicator3-1 libwebkit2gtk-4.0-37 libx11-6 pulseaudio pulseaudio-utils"
description="A cross-platform soundboard"
hash="7e43d77e87c87fae718e4a4455a843d8a4c2f0d21cc783e6bf36dcfe43d0d151"
maintainer="Soundux developers <info@soundux.rocks>"

prepare() {
  # Add repository to provide libpipewire-0.3-dev
  sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
  sudo apt install -y libpipewire-0.3-dev
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
