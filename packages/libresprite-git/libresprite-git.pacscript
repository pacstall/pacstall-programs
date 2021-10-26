maintainer="echometerain <echometer@disroot.org>"
name=libresprite-git
description='fork of last GPL version of aseprite'
depends="libpixman-1-0 libcurl4 libgif7 zlib1g libpng16-16 libjpeg-turbo8 libwebp6 libxcursor1"
build_depends="g++ libx11-dev libxcursor-dev cmake ninja-build zlib1g-dev libpixman-1-dev libpng-dev libjpeg-turbo8-dev libtinyxml-dev libwebp-dev libgif-dev libgtest-dev libfreetype-dev libcurlpp-dev libharfbuzz-dev"
url="https://github.com/LibreSprite/LibreSprite.git"
breaks="aseprite libresprite-bin libresprite-app libresprite-deb libresprite"

pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare(){
	git fetch --all --tags --prune
	git checkout -f "v$version"
	git submodule update --init --recursive
	mkdir build
}
build() {
	cd build
	cmake -G Ninja \
		-DWITH_DESKTOP_INTEGRATION=ON \
		-DUSE_SHARED_PIXMAN=ON \
		-DWITH_WEBP_SUPPORT=ON \
		-DUSE_SHARED_LIBWEBP=ON \
		-DUSE_SHARED_CURL=ON \
		-DUSE_SHARED_GIFLIB=ON \
		-DUSE_SHARED_JPEGLIB=ON \
		-DZLIB_INCLUDE_DIR="/usr/include" \
		-DUSE_SHARED_ZLIB=ON \
		-DUSE_SHARED_LIBPNG=ON \
		-DUSE_SHARED_LIBLOADPNG=OFF \
		-DUSE_SHARED_TINYXML=ON \
		-DENABLE_UPDATER=OFF \
		-DUSE_SHARED_FREETYPE=ON \
		-DFREETYPE_INCLUDE_DIR="/usr/include/freetype2" \
		-DCMAKE_INSTALL_PREFIX:STRING="/usr" ..
	ninja libresprite
	cd ..
}

install() {
	cd build
	sudo DESTDIR="$STOWDIR/$name" ninja install
	sudo install -Dm644 "$SRCDIR/libresprite.desktop" \
		"$STOWDIR/$name/usr/share/applications/libresprite.desktop"
	sudo install -Dm644 "$STOWDIR/$name/usr/share/libresprite/data/icons/ase64.png" \
		"$STOWDIR/$name/usr/share/pixmaps/libresprite.png"
}
