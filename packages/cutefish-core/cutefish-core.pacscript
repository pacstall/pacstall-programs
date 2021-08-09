name="cutefish"
version="0.3"
url="https://github.com/cutefishos/core/archive/refs/tags/${version}.zip"
build_depends="libpolkit-agent-1-dev libpolkit-qt5-1-dev libpulse-dev libsm-dev libxtst-dev libxcb-randr0-dev libxcb-shape0-dev libxcb-xfixes0-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-image0-dev libxcb-util0-dev"
description="System backend and start session and more"
hash="29edc2d5389fe13974c14d5c7e8d6ed36c727ecd1b33fa5343372947ca53d6d4"
pacdeps=("fishui-git")

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/cutefish
}
