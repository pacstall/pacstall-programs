name="fishui-git"
gives="fishui"
version="0.3-1"
url="https://github.com/cutefishos/fishui.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("libkf5windowsystem5" "libxcb-icccm4-dev" "qtquickcontrols2-5-dev" "qtbase5-private-dev" "libxcb-shape0-dev" "libxcb-keysyms1-dev")
description="FishUI is a GUI library based on QQC2 (Qt Quick Controls 2), every Cutefish application uses it."

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

prepare() {
  mkdir build
  cd build || return 1
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
