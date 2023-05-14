name="cutefish-kwin-plugins-git"
gives="cutefish-kwin-plugins"
version="0.2-1"
url="https://github.com/cutefishos/kwin-plugins.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("libkf5config-dev" "libkdecorations2-dev" "libkf5guiaddons-dev" "libkf5coreaddons-dev" "libkf5configwidgets-dev" "libkf5windowsystem-dev" "libkf5wayland-dev" "kwin-dev")
description="CutefishOS KWin Plugins."

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ..
  make -j"$(nproc)"
}

install() {
  cd build
  sudo make install DESTDIR="${pkgdir}"
}
