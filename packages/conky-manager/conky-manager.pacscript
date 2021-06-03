name="conky-manager"
version="1.0"
url="https://github.com/zcot/conky-manager2.git"
build_depends="valac libgee-0.8-dev libgtk-3-dev libjson-glib-dev gettext libgettextpo-dev p7zip-full imagemagick
"
depends=""
description="Simple tool for managing Conky configs"

prepare() {
    true
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/conky-manager
}
