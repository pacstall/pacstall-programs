name="qbittorrent-nox"
breaks="${name}-bin ${name}-git"
replace="qbittorrent"
version="4.4.1"
url="https://github.com/qbittorrent/qbittorrent/archive/refs/tags/release-${version}.tar.gz"
build_depends="build-essential qt5-qmake pkg-config automake libtool git libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev"
depends="qtbase5-dev qttools5-dev libqt5svg5-dev zlib1g-dev python3 libtorrent-rasterbar libssl-dev libgeoip-dev"
ppa=("deluge-team/ppa")
description="qBittorrent BitTorrent client"
hash="144a609514a7b516e65c4a4e32e49529b5e3949a713daf86332cd95867c991ba"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  export PATH=/opt/qt59/bin:$PATH
  export PKG_CONFIG_PATH=/opt/qt59/lib/pkgconfig:$PKG_CONFIG_PATH
  qmake -qt=qt5
}

build() {
  ./configure CXXFLAGS="-std=c++14" --disable-gui
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${name}"
}
