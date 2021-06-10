name="sed"
version="4.8"
url="https://ftp.gnu.org/gnu/sed/sed-"$version".tar.xz"
build_depends="autoconf automake"
depends="libselinux1 libc6 libacl1"
replace="sed"
description="sed (stream editor) is a non-interactive command-line text editor."
hash="f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
          true
}

build() {
        ./configure
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/sed
}
