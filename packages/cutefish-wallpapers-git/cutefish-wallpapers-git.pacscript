name="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
version="0.2-1"
url="https://github.com/cutefishos/wallpapers.git"
license="GPL-3.0"
build_depends=("cmake" "ninja-build")
description="CutefishOS's system wallpaper."

pkgver() {
  mkdir tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 cd tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main .
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
