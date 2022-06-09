name="hello"
repology=("project: ${name}")
version="2.12.1"
url="https://ftp.gnu.org/gnu/${name}/${name}-${version}.tar.gz"
build_depends="build-essential"
depends="libc6"
breaks="${name}-git ${name}-traditional"
replace="${name}"
description="GNU implementation of the classic program that prints “Hello, world!” when you run it"
hash="8d99142afd92576f30b0cd7cb42a8dc6809998bc5d607d88761f512e26c7db20"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
