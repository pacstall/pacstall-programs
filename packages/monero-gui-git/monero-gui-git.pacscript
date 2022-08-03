name="monero-gui-git"
pkgname="monero-gui"
url="https://github.com/monero-project/monero-gui.git"
build_depends="git libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev build-essential cmake pkg-config libprotobuf-dev protobuf-compiler"
depends="qtbase5-dev qtdeclarative5-dev qml-module-qtqml-models2 qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-dialogs qml-module-qtquick-xmllistmodel qml-module-qt-labs-settings qml-module-qt-labs-platform qml-module-qt-labs-folderlistmodel qttools5-dev-tools qml-module-qtquick-templates2 libqt5svg5-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev libssl-dev libzmq3-dev libsodium-dev libhidapi-dev libnorm-dev libusb-1.0-0-dev libpgm-dev libgcrypt20-dev"
breaks="${pkgname}-bin"
description="Open-source graphical user interface (GUI) wallet developed by the Monero community"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    true
}

build() {
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
