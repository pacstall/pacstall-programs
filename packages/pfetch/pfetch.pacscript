name="pfetch"
version="0.6.0"
url="https://github.com/dylanaraps/pfetch/archive/refs/tags/0.6.0.zip"
build_depends=""
depends=""
breaks="pfetch"
description="A lightweight and simple fetch tool"
hash="625c8cfd62279f37dea0849aee7c9fcc89c83f6215ff8540c198ebdc7c470653"
prepare() {
	true
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/pfetch
}
