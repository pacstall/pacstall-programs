name="opentoonz-gts"
version="2.5.1"
url="https://github.com/opentoonz/GTS/archive/refs/tags/v$version.tar.gz"
build_depends="libtiff5-dev libfltk1.3-dev libglew-dev libsane-dev libglu1-mesa-dev"
depends="autoconf libtool autoconf-archive"
description="GTS is a trace scanning tool developed by Studio Ghibli"
hash="625c1d63d4b0a8b60d7ac0e8e69d1ec73b259357f11a1246968469daa57a4a9d"
maintainer="echometerain <echometer@disroot.org>"
patch="https://patch-diff.githubusercontent.com/raw/opentoonz/GTS/pull/149.diff"
removescript="yes"

prepare() {
	sudo mkdir -p "$STOWDIR/$name/usr/bin"
	sudo wget https://raw.githubusercontent.com/pacstall/pacstall-programs/d09a60781f350e8c3dc01202f09a9cfaa5cd84ca/packages/opentoonz-gts/sane-config -P "$STOWDIR/$name/usr/bin"
	sudo chmod +x "$STOWDIR/$name/usr/bin/sane-config"
	git apply "./PACSTALL_patchesdir/149.diff"
}

build() {
	./autogen.sh
	./configure
	make -j$(nproc)
}

install() {
	sudo make install DESTDIR="$STOWDIR/$name"
	mkdir -p "/home/$LOGNAME/.GTS"
	cp "$STOWDIR/$name/usr/local/share/GTS/gts_initial_configuration.txt" "/home/$LOGNAME/.GTS"
}

removescript() {
	ask "Do you want to remove your GTS configuration?" N
	if [[ $answer -eq 1 ]]; then
		sudo rm -rf "/home/$LOGNAME/.GTS"
	fi
}
