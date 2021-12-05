name="i3lock-color"
version="2.13.c.4"
url="https://github.com/Raymo111/i3lock-color/archive/refs/tags/${version}.tar.gz"
build_depends="autoconf gcc make libfontconfig1-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xtest0-dev libxkbcommon-dev"
depends="libxcb-composite0-dev libpam0g-dev libev-dev libcairo2-dev libxkbcommon-x11-dev libjpeg-dev libxcb-xrm-dev pkg-config"
gives=(i3lock i3lock-color)
breaks="i3lock"
replace="i3lock"
description="The world's most popular non-default computer lockscreen."
hash="5df4cd3d515d938630ced981a7f0a6e01344d1ec51d10fd3c3d131d19283df69"
removescript="yes"
maintainer="Harshwardhan Mehrotra <abrakadabra18262@protonmail.com>"
prepare() {
        true
}

build() {
        ./build.sh
}

install() {
       cd build
       sudo make install DESTDIR="$STOWDIR/$name"

}
