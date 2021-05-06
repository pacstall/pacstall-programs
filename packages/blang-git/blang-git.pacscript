name="blang-git"
version="0.0.1"
url="https://github.com/Ganesha2282882/blang.git"
build_depends="python3 python3-pip python3-minimal"
depends="python3-minimal"
description="blang is a object oriented programming language."
prepare() {
          true
          sudo pip3 install pyinstaller
}

build() {
        chmod +x build1
        ./build1
}

install() {
          sudo mkdir -p  /usr/src/pacstall/blang/bin
          sudo cp blang  /usr/src/pacstall/blang/bin
          sudo chmod 755 /usr/src/pacstall/blang/bin/blang
}
