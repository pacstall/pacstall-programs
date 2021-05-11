name="micro"
pkgname="micro"
version="git"
description="The micro text editor"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/zyedidia/micro.git"
depends="build-essential"
gives="micro"
breaks="micro"

prepare() {
    true
}

build() {
    make -j$(nproc) build
}

install() {
    sudo mv micro /usr/src/pacstall/micro
}
