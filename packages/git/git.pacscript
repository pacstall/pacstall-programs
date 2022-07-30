name="git"
replace="${name}"
repology=("project: git")
breaks="${name}-${name}"
version="2.37.1"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="7dded96a52e7996ce90dd74a187aec175737f680dc063f3f33c8932cf5c8d809"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  make configure
}

build() {
  ./configure
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${name}"
}
