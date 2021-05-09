name="paper-icon-theme"
version="1.5.0"
maintainer="aranym <aranym1@pm.me>"
url="https://github.com/snwh/paper-icon-theme/archive/refs/tags/v.1.5.0.tar.gz"
build_depends="meson ninja-build"
depends=""
optdepends=""
gives="paper-icon-theme"
description="Paper is an open source desktop theme and icon project by Sam Hewitt"
hash="62f21dfe95ece481e5c635480f32347f1ad27ea66b2ef0526fe799090b298ece"

prepare() {
        true
}

build() {
        meson "build" --prefix=/usr/src/pacstall/paper-icon-theme/usr &> /dev/null
}

install() {
        sudo ninja -C "build" install
}
