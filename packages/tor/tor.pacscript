name="tor"
version="0.4.6.8"
url="https://dist.torproject.org/${name}-${version}.tar.gz"
build_depends="make autoconf"
replace="tor"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use."
hash="15ce1a37b4cc175b07761e00acdcfa2c08f0d23d6c3ab9c97c464bd38cc5476a"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/$name
}
