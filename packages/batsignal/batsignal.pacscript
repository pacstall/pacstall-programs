name="batsignal"
version="1.5.0"
url="https://github.com/electrickite/batsignal/archive/refs/tags/${version}.zip"
build_depends="libnotify-dev make pkg-config gcc"
replace="batsignal"
description="A lightweight battery monitor daemon"
hash="b7ea386a2b14427c70a63b5e91feebc8213618c9d62d82f569c1dfc2f8737854"
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

prepare() {
        true
}

build() {
  sed -i '40d' Makefile
  sed -i '41d' Makefile
  make -j$(nproc)
}

install() {
  sudo make install -j$(nproc) DESTDIR=/usr/src/pacstall/batsignal

}
