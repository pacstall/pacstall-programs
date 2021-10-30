name="yad"
version="10.1"
url="https://github.com/v1cont/yad/archive/refs/tags/v$version.tar.gz"
build_depends="autotools-dev intltool libgtk-3-dev"
depends="libc6 libcairo2 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libpango-1.0-0 libpanglcairo-1.0-0"
replace="yad"
description="Yet Another Dialog"
hash="2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae"
optdepends=("libwebkit2gtk-4.0-dev: for supporting HTML dialog"
"libgtksourceview-4-dev: for enabling syntax highlighting in text-info dialog"
"libgspell-1-dev: for support spell checking in text fields")
maintainer="echometerain <echometer@disroot.org>"

prepare() {
	autoreconf -ivf
	intltoolize
}

build() {
	./configure
	make
}

install() {
	sudo make install DESTDIR="$STOWDIR/$name"
}

postinst(){
	gtk-update-icon-cache
}
