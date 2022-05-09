name="git"
replace="${name}"
repology=("project: git")
breaks="${name}-${name}"
version="2.36.1"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="37d936fd17c81aa9ddd3dba4e56e88a45fa534ad0ba946454e8ce818760c6a2c"
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
