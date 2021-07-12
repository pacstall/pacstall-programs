name="torsocks-git"
pkgname="torsocks"
url="https://git.torproject.org/$pkgname.git"
build_depends="autoconf libtool gcc automake"
replace="$pkgname"
description="Wrapper to torify applications"
hash="e185245c0bc45d0ba6970da40239238ad4204c36ed207a6f4ab5ba6b5203d2bd"
removescript="yes"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
pacdeps=("tor")
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
          ./autogen.sh
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/$name
          sudo install -Dm644 LICENSE -t /usr/src/pacstall/$name/usr/share/licenses/$pkgname
          sudo install -Dm644 gpl-2.0.txt -t /usr/src/pacstall/$name/usr/share/licenses/$pkgname
          sudo install -Dm644 README.md -t /usr/src/pacstall/$name/usr/share/doc/$pkgname
}

removescript(){
    sudo rm -rf /usr/share/licenses/$pkgname
    sudo rm -rf /usr/share/doc/$pkgname
}