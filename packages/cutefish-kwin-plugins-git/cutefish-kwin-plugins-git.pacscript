name="cutefish-kwin-plugins-git"
gives="cutefish-kwin-plugins"
version="0.2-1"
url="https://github.com/cutefishos/kwin-plugins.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev"
depends="libkf5config-dev libkdecorations2-dev libkf5guiaddons-dev libkf5coreaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5wayland-dev kwin-dev"
description="CutefishOS KWin Plugins."

pkgver() {
    git ls-remote "${url}" main | cut -f1
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
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-kwin-plugins-git
}
