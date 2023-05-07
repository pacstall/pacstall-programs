name="cutefish-icons-git"
gives="cutefish-icons"
version="0.3-1"
url="https://github.com/cutefishos/icons.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build")
description="System default icon theme of CutefishOS."

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
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
