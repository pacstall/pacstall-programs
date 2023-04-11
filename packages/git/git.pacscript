name="git"
replace="${name}"
repology=("project: git")
breaks="${name}-${name}"
version="2.40.0"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf cmake gcc libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info zlib1g-dev zlib1g"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="ab37c343c0ad097282fd311ab9ca521ab3da836e5c4ed2093994f1b7f8575b09"

prepare() {
  make configure
}

build() {
  ./configure --prefix=/usr
  make -j"$(nproc)" all
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
