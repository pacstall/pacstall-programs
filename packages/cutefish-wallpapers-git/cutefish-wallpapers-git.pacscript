name="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
version="0.2-1"
url="https://github.com/cutefishos/wallpapers.git"
license="GPL-3.0"
build_depends=("cmake" "ninja-build")
description="CutefishOS's system wallpaper."

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
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
