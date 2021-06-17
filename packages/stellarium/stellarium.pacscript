name="stellarium"
pkgname="stellarium"
url="https://github.com/Stellarium/stellarium/archive/refs/tags/v0.21.0.zip"
version="0.21.0"
maintainer="Henryws <hwengerstickel@pm.me>"
build_depends="build-essential cmake zlib1g-dev libgl1-mesa-dev libdrm-dev gcc g++ \
                 graphviz doxygen gettext git \
                 qtbase5-dev qtscript5-dev libqt5svg5-dev qttools5-dev-tools qttools5-dev libqt5opengl5-dev \
                 qtmultimedia5-dev libqt5multimedia5-plugins libqt5serialport5 libqt5serialport5-dev qtpositioning5-dev \
                 libgps-dev libqt5positioning5 libqt5positioning5-plugins"
description="Stellarium is a free open source planetarium for your computer. It shows a realistic sky in 3D, just like what you see with the naked eye, binoculars or a telescope."
hash="e623c583e4b4c5e5c136b4273af2a18760b6655bb8c81d278fc39f8aafa492c0"

prepare() {
    mkdir -p build/unix
    cd build/unix
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/" -j$(nproc) ../.. 
    make -j$(nproc)
}

install() {
    sudo make install -j$(nproc) DESTDIR=/usr/src/pacstall/stellarium
}
