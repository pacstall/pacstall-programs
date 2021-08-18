name="maitreya"
version="8.0.1"
url="https://github.com/martin-pe/${name}8/releases/download/v${version}/${name}8_u20_${version}_amd64.deb"
build_depends=""
depends=""
description="Maitreya is a free software for western and Vedic astrology (Jyotish)"
hash="e65f2cdd87fd7c6960d74a9867b338759eeea0305ea702de857db2c7210eb991"
maintainer="Zahrun <Zahrun@github.com>"
prepare() {
	./autogen.sh
}

build() {
	./configure
	make -j$(nproc)
}

install() {
	sudo make install DESTDIR="$STOWDIR/$name"
}

postinst() {
	echo
}
