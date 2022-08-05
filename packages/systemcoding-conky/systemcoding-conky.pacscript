name="systemcoding-conky"
pkgname="conky"
version="1.0"
url="https://github.com/systemcoding/systemcoding-conky/releases/download/release/systemcoding-conky.zip"
maintainer="System Coding <revanthnagmunagala@gmail.com>"
build_depends="conky lm-sensors"
gives="conky"
description="System Coding's Version Of Conky"
breaks="conky"

prepare() {
          true
}

build() {
          true
}

install() {
          sudo install -D conky/.conkyrc -t /usr/src/pacstall/systemcoding-conky
}
