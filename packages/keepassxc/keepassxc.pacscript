name="keepassxc"
version="2.7.1"
description="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc" "repo: archlinuxarm_aarch64")
url="https://github.com/keepassxreboot/keepassxc/releases/download/${version}/keepassxc-${version}-src.tar.xz"
hash="6001ba626c35c316dbda6de35736f012a2264f95139fcb4a094b8eb49b15d3e7"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="org.freedesktop.secrets"

depends="argon2 botan curl hicolor-icon-theme libxtst6 minizip libpcsclite1 qrencode libqt5concurrent libqt5x11extras5 libqt5x11extras5-dev libqt5svg5-dev libqt5svg5 libminizip1 libqrencode4 zlib1g-dev libxtst-dev qtbase5-private-dev qttools5-dev qtbase5-dev qtdeclarative5-dev"
build_depends="cmake asciidoctor libqrencode-dev libbotan-2-dev libargon2-dev libpcsclite-dev libminizip-dev libusb-1.0-0-dev libreadline-dev"
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
