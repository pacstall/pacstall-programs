name="git"
version="2.33.0"
url="https://mirrors.edge.kernel.org/pub/software/scm/$name/$name-$version.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
replace="git"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
hash="02d909d0bba560d3a1008bd00dd577621ffb57401b09175fab2bf6da0e9704ae"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
removescript="yes"

prepare() {
          make configure
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          make install DESTDIR=/usr/src/pacstall/$name
          install -Dm644 COPYING -t /usr/src/pacstall/$name/usr/share/licenses/$name
          install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$name
}

removescript() {
    sudo rm -rf /usr/share/licenses/$name
    sudo rm -rf /usr/share/doc/$name
}
