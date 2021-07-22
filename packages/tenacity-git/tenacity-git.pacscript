name="tenacity-git"
version="r23.g098a0225e"
url="https://github.com/tenacityteam/tenacity.git"
build_depends="build-essential cmake git python3-pip ffmpeg"
depends="libgtk2.0-dev libasound2-dev libavformat-dev libjack-jackd2-dev uuid-dev"
replace="audacity"
description="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"
hash="c06c60a9ae17b9265840fcd619d2c7a5668f26a94cec80c8785c7997afd4bc96" 
optdepends="ffmpeg: additional import/export capabilities"
maintainer="echometer <guacamolek@yandex.com>"
prepare() {
          sudo pip3 install conan
}

build() {
        sudo mkdir build
        cd build
        sudo cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -Duse_ffmpeg=loaded .. 
        sudo make -j$(nproc)
}

install() {
          sudo make install DESTDIR="$STOWDIR/$name"
}

postinst(){
          true
}
