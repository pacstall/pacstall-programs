name="git"
version="2.34.1"
url="https://mirrors.edge.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
replace="git"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
hash="fc4eb5ecb9299db91cdd156c06cdeb41833f53adc5631ddf8c0cb13eaa2911c1"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  make configure
}

build() {
  ./configure
  make -j$(nproc)
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/$name
  sudo install -Dm644 COPYING -t /usr/src/pacstall/$name/usr/share/licenses/$name
  sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$name
}

removescript() {
  sudo rm -rf /usr/share/licenses/$name
  sudo rm -rf /usr/share/doc/$name
}
