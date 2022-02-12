name="wine"
pkgname="wine"
version="7.2"
url="https://github.com/wine-mirror/wine/archive/refs/tags/wine-${version}.zip"
build_depends="gcc-mingw-w64 libasound2-dev libpulse-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libpng-dev libtiff-dev libgl-dev libunwind-dev libxml2-dev libxslt1-dev libfaudio-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmpg123-dev libosmesa6-dev libsdl2-dev libudev-dev libvkd3d-dev libvulkan-dev libcapi20-dev liblcms2-dev libcups2-dev libgphoto2-dev libsane-dev libgsm1-dev libkrb5-dev libldap2-dev samba-dev ocl-icd-opencl-dev libpcap-dev libusb-1.0-0-dev libv4l-dev flex bison"
description="Wine is a compatibility layer capable of running Windows applications on several POSIX-compliant operating systems"
hash="14acde3cabdd3dfd5b084467426f9081cc766a1415b28f903510e9026d9ab396"
maintainer="Henryws <hwengerstickel@pm.me>"
prepare() {
          ./configure --enable-win64
}

build() {
          make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall/wine
}
