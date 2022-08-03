name="tenacity-git"
url="https://github.com/tenacityteam/tenacity.git"
build_depends="build-essential libavcodec-dev libavformat-dev libavutil-dev libflac++-dev libglib2.0-dev libgtk-3-dev libid3tag0-dev libjack-dev liblilv-dev libmad0-dev libmp3lame-dev libogg-dev libpng-dev portaudio19-dev libportmidi-dev libserd-dev libsndfile1-dev libsord-dev libsoundtouch-dev libsoxr-dev libsuil-dev libtwolame-dev vamp-plugin-sdk libvorbis-dev lv2-dev zlib1g-dev cmake ninja-build libjpeg-dev libtiff-dev liblzma-dev libsqlite3-dev libwxgtk3.0-gtk3-dev"
depends="libavcodec58 libavformat58 libavutil56 libc6 libexpat1 libflac++6v5 libflac8 libgcc-s1 libgdk-pixbuf-2.0-0 libglib2.0-0 libgtk-3-0 libid3tag0 liblilv-0-0 libmad0 libogg0 libportaudio2 libportsmf0v5 libsndfile1 libsoundtouch1 libsoxr0 libstdc++6 libsuil-0-0 libtwolame0 libvamp-hostsdk3v5 libvorbis0a libvorbisenc2 libvorbisfile3 libwxbase3.0-0v5 libwxgtk3.0-gtk3-0v5"
replace="audacity"
description="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"

optdepends="ffmpeg: additional import/export capabilities"
maintainer="echometerain <echometer@disroot.org>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
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
