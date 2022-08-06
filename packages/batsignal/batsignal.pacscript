name="batsignal"
repology=("project: ${name}")
version="1.5.1"
url="https://github.com/electrickite/batsignal/archive/refs/tags/${version}.tar.gz"
build_depends="make pkg-config gcc sed"
depends="libnotify-dev"
breaks="${name} ${name}-git"
description="A lightweight battery monitor daemon"
hash="99f09816529932b73f95d1989dc29fa952468193f7438e232d4e0627be01969b"
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

prepare() {
  true
}

build() {
  sed -i '40d' Makefile
  sed -i '41d' Makefile
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}
