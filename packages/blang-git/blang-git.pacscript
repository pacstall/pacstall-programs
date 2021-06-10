name="blang-git"
url="https://github.com/Ganesha2282882/blang.git"
build_depends="python3 python3-pip python3-minimal"
depends="python3-minimal"
description="blang is a object oriented programming language."
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
          true
          sudo pip3 install pyinstaller
}

build() {
        chmod +x build1
        ./build1
}

install() {
          sudo mkdir -p  /usr/src/pacstall/blang-git/usr/bin
          sudo cp blang  /usr/src/pacstall/blang-git/usr/bin
          sudo chmod 755 /usr/src/pacstall/blang-git/usr/bin/blang
}
