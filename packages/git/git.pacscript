name="git"
version="2.32.0"
url="https://www.kernel.org/pub/software/scm/$name/$name-$version.tar.gz"
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
replace="git"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
hash="6038f06d396ba9dab2eee541c7db6e7f9f847f181ec62f3d8441893f8c469398"
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
          sudo make install DESTDIR=/usr/src/pacstall/$name
          sudo install -Dm644 COPYING /usr/src/pacstall/git/usr/share/licenses/$name            
}

removescript() {
    sudo rm -rf /usr/share/licenses/$name
}
