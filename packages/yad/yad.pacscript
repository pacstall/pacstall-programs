name="yad"
version="10.1"
url="https://github.com/v1cont/yad/archive/refs/tags/v$version.tar.gz"
build_depends="autotools-dev intltool libgtk-3-dev"
depends="libc6 libcairo2 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libpango-1.0-0 libpangocairo-1.0-0"
replace="yad"
gives="yad"
description="Yet Another Dialog"
hash="769e723a8f227ce4430f89fda4c79809ad46fb3c04d34ee466b51cf5e0f1c373"
optdepends=("libwebkit2gtk-4.0-dev: for supporting HTML dialog"
"libgtksourceview-4-dev: for enabling syntax highlighting in text-info dialog"
"libgspell-1-dev: for support spell checking in text fields")
maintainer="echometerain <echometer@disroot.org>"

prepare() {
	autoreconf -ivf
	intltoolize
	
	FLAGS="--enable-icon-browser --enable-gio"
	dpkg-query -W libwebkit2gtk-4.0-dev > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		FLAGS+=" --enable-html"
	fi
	dpkg-query -W libgspell-1-dev > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		FLAGS+=" --enable-spell"
	fi
	dpkg-query -W libgtksourceview-4-dev > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		FLAGS="$FLAGS --enable-sourceview"
	fi
}

build() {
	./configure "$FLAGS"
	make
}

install() {
	sudo make install DESTDIR="$STOWDIR/$name"
}

postinst(){
	gtk-update-icon-cache
}
