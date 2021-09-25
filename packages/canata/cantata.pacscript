name="cantata"
pkgname="cantata"
version="2.4.2"
url="https://github.com/CDrummond/cantata/releases/download/v${version}/cantata-${version}.tar.bz2"
depends="mpd media-player-info fonts-font-awesome libcddb2 qttools5-dev qtbase5-dev qtchooser qtmultimedia5-dev qt5-qmake qtbase5-dev-tools  libqt5svg5 libebur128-1 libmusicbrainz5cc2v5 libqt5multimedia5"
description="Cantata is a graphical client for MPD. It is support for Linux, MacOSX, and Windows, Multiple MPD collections and it has a Highly customizable layout."
maintainer="ty1118 <tylerbj16@gmail.com>"
hash="3ed25d0c838720af7ed08b89a30f3e05d6952d40a5f520f29b3558b2eacdec82"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=${STOWDIR}/${name}
}

# vim:set ft=sh ts=4 sw=4 et:
