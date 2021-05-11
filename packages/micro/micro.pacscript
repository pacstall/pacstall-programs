name="micro"
pkgname="micro"
version="2.0.8"
description="The micro text editor"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://github.com/zyedidia/micro/releases/download/v2.0.8/micro-2.0.8-linux64.tar.gz"
build_depends="build-essential golang"
gives="micro"
breaks="micro"
hash="7a705a60fe5da8fdfbb1423b560ae120a59af963ec73e3548ef97a6a688cd7cf"
prepare() {
    true
}

build() {
    chmod +x micro
}

install() {
    sudo mkdir /usr/src/pacstall/micro/
    sudo mkdir /usr/src/pacstall/micro/usr/
    sudo mkdir /usr/src/pacstall/micro/usr/bin/
    sudo cp micro /usr/src/pacstall/micro/usr/bin
}
