name="torsocks-git"
pkgname="torsocks"
url="https://github.com/dgoulet/$pkgname.git"
build_depends="autoconf libtool gcc automake"
replace="$pkgname"
description="Wrapper to torify applications"
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
