name="batsignal"
repology=("project: ${name}")
version="1.6.2"
url="https://github.com/electrickite/batsignal/archive/refs/tags/${version}.tar.gz"
build_depends="make pkg-config gcc sed"
depends="libnotify4 libcurl4-opennssl-dev libnotify-dev"
breaks="${name} ${name}-git"
description="A lightweight battery monitor daemon"
hash="0576257b6b960826799641e15521317a2d075d24f5da0c1abf180e2731022673"
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

prepare() {
  true
}

build() {
  sed -i '47d' Makefile
  sed -i '48d' Makefile
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}
