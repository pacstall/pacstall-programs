name="tor"
version="0.4.6.7"
url="https://dist.torproject.org/$name-$version.tar.gz"
build_depends="make autoconf"
replace="tor"
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g-dev"
description="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use."
hash="ff665ce121b2952110bd98b9c8741b5593bf6c01ac09033ad848ed92c2510f9a"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure
    make -j$(nproc)
}

install() {
    make install DESTDIR=/usr/src/pacstall/$name
}
