name="opentoonz"
version="1.5.0"
url="https://github.com/opentoonz/opentoonz/archive/refs/tags/v$version.tar.gz"
build_depends="libboost-all-dev qtbase5-dev libqt5svg5-dev qtscript5-dev qttools5-dev libqt5opengl5-dev qtmultimedia5-dev libqt5serialport5-dev libsuperlu-dev liblz4-dev libusb-1.0-0-dev liblzo2-dev libpng-dev libjpeg-dev libglew-dev freeglut3-dev libfreetype6-dev libjson-c-dev qtwayland5 libmypaint-dev libopencv-dev libturbojpeg-dev libmypaint-dev libopenblas-dev libegl1-mesa-dev libgles2-mesa-dev libglib2.0-dev liblzma-dev"
depends="qtchooser qt5-qmake qtbase5-dev-tools qttools5-dev-tools libqt5multimedia5-plugins qtwayland5 libgsl25 build-essential git cmake pkg-config"
description="An open-source full-featured 2D animation creation software"
hash="fba0f381fb71ffda89e6423b4d461450d4851f93830342e69e36313070af5990"
maintainer="echometerain <echometer@disroot.org>"

prepare() {

	sudo mkdir -p "$STOWDIR/$name/home/$LOGNAME/.config/OpenToonz"
	sudo cp -r "opentoonz/stuff" "$STOWDIR/$name/home/$LOGNAME/.config/OpenToonz/"
	sudo chown -R $LOGNAME "$STOWDIR/$name/home/$LOGNAME/.config/OpenToonz/"
	
	cd toonz
	mkdir build
	cd ../
}

build() {

	cd "thirdparty/tiff-4.0.3"
	./configure --with-pic --disable-jbig
	make -j$(nproc)
	cd ../../
	
	cd "toonz/build"
	cmake "../sources"
	make -j$(nproc)
	cd ../../
	
}

install() {

	cd "toonz/build"
	sudo make install DESTDIR="$STOWDIR/$name"
	sudo chmod +x "$STOWDIR/$name/opt/$name/bin/opentoonz"
	sudo ln -s "$STOWDIR/$name/opt/$name/bin/opentoonz" "/usr/bin/opentoonz"
}
