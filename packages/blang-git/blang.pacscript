name="blang"
version="0.0.1"
url="https://github.com/Ganesha2282882/blang/archive/refs/heads/main.zip"
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
          sudo cp blang        /bin
          sudo chown root:root /bin/blang
          sudo chmod 755       /bin/blang
}
