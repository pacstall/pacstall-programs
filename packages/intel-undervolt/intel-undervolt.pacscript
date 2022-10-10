name="intel-undervolt"
version="1.7"
url="https://github.com/kitsunyan/intel-undervolt/archive/refs/tags/${version}.tar.gz"
hash="29a7ebaee4830d65d0b5cefa6d497887d4f23f34659876dfe944f3a020cf33ff"
build_depends="pkg-config"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Tool for undervolting and throttling limits alteration for Intel CPUs"

prepare() {
  # other flags are '--enable-systemd', '--enable-slogind', '--enable-openrc'
  ./configure
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
