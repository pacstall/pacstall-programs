name="batsignal"
version="1.3.2"
url="https://github.com/electrickite/batsignal/archive/refs/tags/${version}.zip"
build_depends="libnotify-dev make pkg-config gcc"
replace="batsignal"
description="A lightweight battery monitor daemon"
hash="1eb564c94f4a49900196125f02980d747e8eb7901715ad05de1042f7b54d3a20"
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

prepare() {
        true
}

build() {
  make -j$(nproc)
}

install() {
  sudo make install -j$(nproc) DESTDIR=/usr/src/pacstall/batsignal

}
