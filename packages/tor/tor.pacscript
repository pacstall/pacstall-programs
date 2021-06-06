name="tor"
pkgname="tor"
version="0.4.5.8"
url="https://dist.torproject.org/tor-0.4.5.8.tar.gz"
build_depends=""
depends="libevent-dev libnss3-dev libzstd-dev liblzma-dev openssl libssl-dev ca-certificates libseccomp-dev zlib1g zlib1g-dev"
breaks=""
description="Tor protects your privacy on the internet by hiding the connection
between your Internet address and the services you use."
hash="57ded091e8bcdcebb0013fe7ef4a4439827cb169358c7874fd05fa00d813e227"
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
