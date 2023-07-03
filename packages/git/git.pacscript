name="git"
replace=("${name}")
repology=("project: git")
breaks=("${name}-${name}")
version="2.41.0"
url="https://www.kernel.org/pub/software/scm/${name}/${name}-${version}.tar.gz"
build_depends=("dh-autoreconf" "cmake" "gcc" "libcurl4-gnutls-dev" "libexpat1-dev" "gettext" "libz-dev" "libssl-dev" "asciidoc" "xmlto" "docbook2x" "install-info" "zlib1g-dev" "zlib1g")
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals"
hash="c4a6a3dd1827895a80cbd824e14d94811796ae54037549e0da93f7b84cb45b9f"

prepare() {
  make configure
}

build() {
  ./configure
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
