name="batsignal"
version="1.2.0"
url="https://github.com/electrickite/batsignal/archive/refs/tags/${version}.zip"
build_depends="libnotify-dev make pkg-config gcc"
replace="batsignal"
description="A lightweight battery monitor daemon"
hash="c9e17c1e02355d257952d13072791063240b42ebfb4e0f30cc28fe944aa6de4d"
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

prepare() {
        true
}

build() {
	make -j$(nproc)C
}

install() {
	 sudo make install -j$(nproc) DESTDIR=/usr/src/pacstall/batsignal

}
