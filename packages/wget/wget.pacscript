name="wget"
repology=("project: ${name}")
version="1.21.3"
url="https://ftp.gnu.org/gnu/${name}/${name}-${version}.tar.gz"
build_depends="build-essential"
depends="zlib1g-dev uuid-dev libssl-dev libpsl-dev libpcre3-dev=2:8.39-12build1 libc6 libidn-dev"
breaks="${name}-git ${name}-ssl"
replace="${name}"
description="GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols"
hash="5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5"
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
