name="git"
version="2.35.1"
url="https://mirrors.edge.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
replace="git"
repology=("project: git")
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
hash="9845a37dd01f9faaa7d8aa2078399d3aea91b43819a5efea6e2877b0af09bd43"
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
  sudo install -Dm644 "COPYING" -t "/usr/src/pacstall/${name}/usr/share/licenses/${name}"
  sudo install -Dm644 "README.md" -t "/usr/src/pacstall/${name}/usr/share/doc/${name}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
