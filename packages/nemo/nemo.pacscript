name="nemo"
pkgname="nemo"
version="master"
url="https://salsa.debian.org/cinnamon-team/nemo.git"
license="GPL"
build_depends="libgtk-3-dev libgirepository1.0-dev libnotify-dev cinnamon-desktop-environment libcinnamon-desktop-dev libgail-3-dev libxml2-dev libxapp-dev libexif-dev libexempi-dev intltool"
depends="meson"
gives="nemo"
breaks="thing"

prepare() {
          meson build
}

build() {
        cd build
        sudo ninja
}

install() {
          sudo porg -lp nemo "sudo ninja install"
}
