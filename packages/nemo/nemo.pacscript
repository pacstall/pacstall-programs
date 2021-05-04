name="nemo"
pkgname="nemo"
version="4.8.6-1"
url="https://salsa.debian.org/cinnamon-team/nemo/-/archive/debian/4.8.6-1/nemo-debian-4.8.6-1.zip"
license="GPL"
build_depends="meson libgtk-3-dev libgirepository1.0-dev libnotify-dev cinnamon-desktop-environment libcinnamon-desktop-dev libgail-3-dev libxml2-dev libxapp-dev libexif-dev libexempi-dev intltool"
depends=""
gives="nemo"
breaks="thing"

prepare() {
          meson --prefix="/usr/src/pacstall/nemo" build 
}

build() {
        cd build
        sudo ninja -j$(nproc)
}

install() {
          sudo DESTDIR=/usr/src/pacstall/nemo ninja install"
}
