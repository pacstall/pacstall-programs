name="cmatrix"
version="2.0"
url="https://github.com/abishekvashok/$name/releases/download/v$version/$name-v$version-Butterscotch.tar"
build_depends="autoconf make"
depends="libncurses5-dev libncursesw5-dev"
description="Terminal based The Matrix like implementation"
hash="e46c739bfe79e570db2461f89ac66ea79a8fab8efb8423ab53f143e93c2553bc"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
removescript="yes"

prepare() {
          true
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
