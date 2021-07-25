name="wine"
pkgname="wine"
version="6.10"
url="https://github.com/wine-mirror/wine/releases/tag/wine-6.10.zip"
build_depends="gcc-mingw-w64 libasound2-dev libpulse-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libjpeg62-turbo-dev libpng-dev libtiff-dev libgl-dev libunwind-dev libxml2-dev libxslt1-dev libfaudio-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmpg123-dev libosmesa6-dev libsdl2-dev libudev-dev libvkd3d-dev libvulkan-dev libcapi20-dev liblcms2-dev libcups2-dev libgphoto2-dev libsane-dev libgsm1-dev libkrb5-dev libldap2-dev samba-dev ocl-icd-opencl-dev libpcap-dev libusb-1.0-0-dev libv4l-dev"
description="Wine is a compatibility layer capable of running Windows applications on several POSIX-compliant operating systems"
hash="a4fa1d3e82406112225a8610572aede8e9740210c65969f0e2b032b29aed95aa"
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
