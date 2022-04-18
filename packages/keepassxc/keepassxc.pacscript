name="keepassxc"
version="2.7.1"
description="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc" "repo: archlinuxarm_aarch64")
url="https://github.com/keepassxreboot/keepassxc/releases/download/${version}/keepassxc-${version}-src.tar.xz"
hash="6001ba626c35c316dbda6de35736f012a2264f95139fcb4a094b8eb49b15d3e7"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="org.freedesktop.secrets"

depends="argon2 botan curl hicolor-icon-theme libxtst6 minizip libpcsclite1 qrencode libqt5x11extras5 libqt5svg5"
build_depends="cmake asciidoctor qttools5-dev qtbase5-dev qtdeclarative5-dev libqt5x11extras5-dev libqt5svg5-dev libbotan-2-dev"
optdepends=("xclip: keepassxc-cli clipboard support under X server"
            "wl-clipboard: keepassxc-cli clipboard support under Wayland")

prepare() {
    true
}

build() {
    sudo cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_XC_ALL=ON \
    -DWITH_XC_UPDATECHECK=OFF
    sudo cmake --build build
}

install() {
    sudo cmake --build build --target install -- DESTDIR="${STOWDIR}/${name}"
}
