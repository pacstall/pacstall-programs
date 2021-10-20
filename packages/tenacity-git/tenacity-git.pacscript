name="tenacity-git"
url="https://github.com/tenacityteam/tenacity.git"
build_depends="build-essential cmake git python3-pip ffmpeg"
depends="libgtk2.0-dev libasound2-dev libavformat-dev libjack-jackd2-dev uuid-dev libqt5gui5 mp3lame0 soxr portaudio-dev libwxgtk3.0-gtk3-dev"
replace="audacity"
description="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"
optdepends="ffmpeg: additional import/export capabilities"
maintainer="echometerain <echometer@disroot.org>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
    sudo pip3 install conan
}

build() {
    mkdir build
    cd build
    cmake -G "Unix Makefiles" \
        -DESTDIR="$STOWDIR/$name" \
        -DCMAKE_BUILD_TYPE=Release \
        -Duse_ffmpeg=loaded ..
	make -j$(nproc)
}

install() {
    sudo make install DESTDIR="$STOWDIR/$name"
}
