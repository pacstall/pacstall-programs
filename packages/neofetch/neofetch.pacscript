name="neofetch"
pkgname="neofetch"
version="7.1.0"
url="https://github.com/dylanaraps/neofetch/archive/7.1.0.zip"
build_depends=""
depends="w3m-img libsixel-dev catimg jp2a caca-utils libcaca-dev"
gives="neofetch"
breaks="afajse"
description="Neofetch is a command-line system information tool written in bash 3.2+"
hash="e610da6561f17c8161337d0c4115da310be576e8699fa2add64e14eeb3f3dcf1"

prepare() {
          true
          
}

build() {
          true 
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/neofetch
}
