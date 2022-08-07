name="systemcoding-conky"
pkgname="conky"
version="1.0"
url="https://github.com/systemcoding/systemcoding-conky/releases/download/release/systemcoding-conky.zip"
maintainer="System Coding <revanthnagmunagala@gmail.com>"
build_depends="conky lm-sensors"
gives="conky"
description="System Coding's Version Of Conky"
hash="c87be1530a56cfc435ff82cf06a4c6b5914e95bd51944726ae183f4baac08cca"
breaks="conky"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo install -D conky/.conkyrc -t "${STOWDIR}/${name}"
}
