name="git"
replace="${name}"
repology=("project: git")
breaks="${name}-${name}"
version="2.35.3"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
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
