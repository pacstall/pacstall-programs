name="opentoonz-gts"
version="2.5.1"
url="https://github.com/opentoonz/GTS/archive/refs/tags/v$version.tar.gz"
build_depends="libtiff5-dev libfltk1.3-dev libglew-dev libsane-dev libglu1-mesa-dev"
depends="autoconf libtool autoconf-archive"
description="GTS is a trace scanning tool developed by Studio Ghibli"
hash="625c1d63d4b0a8b60d7ac0e8e69d1ec73b259357f11a1246968469daa57a4a9d"
maintainer="echometerain <echometer@disroot.org>"

prepare() {
	sudo wget https://gist.githubusercontent.com/mrwm/6269117b42d71df9dd1b91fafbc9d4ed/raw/302bd1300e72125c4e1d52b8eef7b5a00c5bf19a/sane-config -P "/usr/bin"
	sudo chmod +x "/usr/bin/sane-config"
	wget https://patch-diff.githubusercontent.com/raw/opentoonz/GTS/pull/149.diff
	git apply 149.diff
}

build() {
	./autogen.sh
	./configure
	make -j$(nproc)
}

install() {
	sudo make install DESTDIR="$STOWDIR/$name"
	mkdir -p "$HOME/.GTS"
	cp "$STOWDIR/$name/usr/local/share/GTS/gts_initial_configuration.txt" "$HOME/.GTS"
}
