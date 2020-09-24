name="neofetch"
pkgname="neofetch"
version="7.1.0"
url="https://github.com/dylanaraps/neofetch/archive/7.1.0.zip"
build_depends=""
depends="w3m-img libsixel termpix pixterm catimg jp2a caca-utils libcaca"
gives="neofetch"
breaks="afajse"
description="Neofetch is a command-line system information tool written in bash 3.2+"

prepare() {
          cd neofetch-7.1.0
          
}

build() {
        echo
}

install() {
          sudo porg -lp neofetch "make install"
}
