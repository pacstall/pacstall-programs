name="qbittorrent"
breaks="${gives}-bin ${gives}-git ${gives}-app"
replace="${gives}"
version="4.4.1"
url="https://github.com/${name}/${name}/archive/refs/tags/release-${version}.tar.gz"
build_depends="build-essential pkg-config automake libtool git libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev"
depends="zlib1g-dev python3 checkinstall qtbase5-dev qttools5-dev libqt5svg5-dev libtorrent-rasterbar-dev libssl-dev libgeoip-dev"
description="qBittorrent BitTorrent client"
hash="144a609514a7b516e65c4a4e32e49529b5e3949a713daf86332cd95867c991ba"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  true
}

build() {
  ./configure CXXFLAGS="-std=c++14"
  make -j"$(nproc)"
  sudo checkinstall --nodoc --backup=no --deldesc --pkgname ${name} --pkgversion ${version}-source-compile
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${name}"
}
