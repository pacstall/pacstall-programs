name="cutefish-icons-git"
gives="cutefish-icons"
version="0.3-1"
url="https://github.com/cutefishos/icons.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build")
description="System default icon theme of CutefishOS."

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
  sudo make install DESTDIR="${pkgdir}"
}
