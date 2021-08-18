name="git"
<<<<<<< HEAD
version="2.33.0"
url="https://mirrors.edge.kernel.org/pub/software/scm/$name/$name-$version.tar.gz"
=======
version="2.32.0"
url="https://www.kernel.org/pub/software/scm/$name/$name-$version.tar.gz"
>>>>>>> Delete sync-repo.yml
build_depends="dh-autoreconf"
depends="libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev asciidoc xmlto docbook2x install-info"
replace="git"
description="git is a fast, scalable, distributed revision control system with an unusually rich command set that provides both high-level operations and full access to internals."
<<<<<<< HEAD
hash="02d909d0bba560d3a1008bd00dd577621ffb57401b09175fab2bf6da0e9704ae"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
removescript="yes"

=======
hash="6038f06d396ba9dab2eee541c7db6e7f9f847f181ec62f3d8441893f8c469398"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
removescript="yes"
>>>>>>> Delete sync-repo.yml
prepare() {
          make configure
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/$name
<<<<<<< HEAD
          sudo install -Dm644 COPYING -t /usr/src/pacstall/$name/usr/share/licenses/$name
          sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$name
=======
          sudo install -Dm644 COPYING /usr/src/pacstall/git/usr/share/licenses/$name
          sudo install -Dm644 README.md /usr/src/pacstall/git/usr/share/doc/$name
>>>>>>> Delete sync-repo.yml
}

removescript() {
    sudo rm -rf /usr/share/licenses/$name
    sudo rm -rf /usr/share/doc/$name
}
