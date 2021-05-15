name="st-distrotube"
pkgname="st"
version="git"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://gitlab.com/dwt1/st-distrotube.git"
build_depends="make libharfbuzz-bin libxft-dev libpango1.0-dev"
depends="fontconfig"
gives="st"
description="Distrotube's st build"
breaks="st"

prepare() {
          true
}

build() {
        make -j$(nproc)
}

install() {
        sudo make install DESTDIR=/usr/src/pacstall/st-distrotube
}
