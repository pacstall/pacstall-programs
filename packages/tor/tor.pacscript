name="tor"
version="0.4.6.6"
url="https://dist.torproject.org/tor-"$version".tar.gz"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use."
hash="3423189ba455372021ed44e0be576d181f2908cbd9bdef202d9c11c950882e12"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/tor
}
