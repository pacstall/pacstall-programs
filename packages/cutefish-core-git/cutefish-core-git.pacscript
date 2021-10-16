name="cutefish-core-git"
gives="cutefish-core"
version="0.3-1"
url="https://github.com/cutefishos/core.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev"
depends="fishui libpulse-dev libxtst6 libpolkit-agent-1-dev libxcb-randr0-dev libxcb1-dev libsm-dev libxcursor-dev libxcb-xfixes0-dev libxcb-damage0-dev libxcb-composite0-dev libxcb-shm0-dev libxcb-util-dev libxcb-image0-dev libxtst-dev libpulse-dev libpolkit-qt5-1-dev libkf5windowsystem-dev libkf5globalaccel-dev libqt5x11extras5-dev qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev qttools5-dev-tools"
description="System backend and start session and more."

pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-core-git
}
