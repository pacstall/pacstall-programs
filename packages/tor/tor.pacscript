name="tor"
repology=("project: ${name}")
replace="${name}"
breaks="${name]-git"
version="0.4.7.7"
url="https://dist.torproject.org/${name}-${version}.tar.gz"
build_depends="make autoconf"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use"
hash="3e131158b52b9435d7e43d1c47ef288b96d005342cc44b8c950bb403851a5b44"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure --enable-lzma --enable-zstd
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
