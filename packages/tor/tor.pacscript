name="tor"
version="0.4.6.10"
url="https://dist.${name}project.org/${name}-${version}.tar.gz"
build_depends="make autoconf"
replace="${name}"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use"
hash="94ccd60e04e558f33be73032bc84ea241660f92f58cfb88789bda6893739e31c"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure --enable-lzma --enable-zstd
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="/usr/src/pacstall/${name}"
}
