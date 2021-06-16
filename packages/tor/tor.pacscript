name="tor"
version="0.4.6.5"
url="https://dist.torproject.org/tor-"$version".tar.gz"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use."
hash="7b6d354e0d9791eace4b51e92211909308297b7aa257993937163d7ee0694cf9"
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
