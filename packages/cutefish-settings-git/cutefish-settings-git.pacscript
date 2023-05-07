name="cutefish-settings-git"
gives="cutefish-settings"
version="0.3-1"
url="https://github.com/cutefishos/settings.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libfontconfig1" "libfreetype-dev" "libicu-dev" "libkf5coreaddons-dev" "libcutefish" "modemmanager-qt-dev" "libkf5networkmanagerqt-dev")
description="System Settings application for Cutefish Desktop."

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  mkdir build
  cd build
}

build() {
  cmake ..
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
