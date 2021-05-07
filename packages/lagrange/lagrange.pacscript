name="lagrange"
version="1.3.4"
license="BSD-2"
url="https://git.skyjake.fi/gemini/lagrange/releases/download/v1.3.4/lagrange-1.3.4.tar.gz"
build_depends="git cmake libsdl2-dev libssl-dev libpcre3-dev zlib1g-dev libunistring-dev libmpg123-dev"
depends=""
description="A Beautiful Gemini Client"
hash="0602bf65d79a1495818ab64717951d1c99057ed20e8c7bb621c8d5b693420b81"
removescript="yes"

prepare() {
    mkdir build
}

build() {
    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/src/pacstall/lagrange/usr -DENABLE_123=ON
}

install() {
    cmake --build . --target install -- -j $(nproc)
}

postinst() {
        glib-compile-schemas /usr/share/glib-2.0/schemas
        update-desktop-database -q /usr/share/applications
        gtk-update-icon-cache -qtf  /usr/share/icons/hicolor
}

removescript() {
        update-desktop-database -q /usr/share/applications
}
