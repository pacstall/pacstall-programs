name="tenacity-git"
url="https://github.com/tenacityteam/tenacity.git"
build_depends="build-essential cmake git python3-pip ffmpeg libmp3lame-dev libsndfile1-dev ninja-build libavcodec-dev libavformat-dev libavutil-dev libflac++-dev libglib2.0-dev libgtk-3-dev libid3tag0-dev libjack-dev liblilv-dev libmad0-dev libmp3lame-dev libogg-dev libpng-dev portaudio19-dev libportmidi-dev libserd-dev libsndfile1-dev libsord-dev libsoundtouch-dev libsoxr-dev libsuil-dev libtwolame-dev vamp-plugin-sdk libvorbis-dev lv2-dev zlib1g-dev libjpeg-dev libtiff-dev liblzma-dev libsqlite3-dev libwxgtk3.0-gtk3-dev"
depends="libgtk2.0-dev libasound2-dev libavformat-dev libjack-jackd2-dev uuid-dev libqt5gui5 libmp3lame0 libsndfile1"
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
  sudo make -j$(nproc)
}

install() {
    sudo make install DESTDIR="$STOWDIR/$name"
}
