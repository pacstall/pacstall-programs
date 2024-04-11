pkgname="tenacity-git"
source=("https://codeberg.org/tenacityteam/tenacity.git")
pkgver="1.3.1"
makedepends=("python3-pip" "build-essential" "ninja-build" "libavcodec-dev" "libavformat-dev" "libavutil-dev" "libavdevice-dev" "libavfilter-dev" "libpostproc-dev" "libportsmf-dev" "libflac++-dev" "libglib2.0-dev" "libgtk-3-dev" "libid3tag0-dev" "libjack-jackd2-dev" "liblilv-dev" "libmad0-dev" "libmp3lame-dev" "libogg-dev" "libpng-dev" "portaudio19-dev" "libportmidi-dev" "libserd-dev" "libsndfile1-dev" "libsord-dev" "libsoundtouch-dev" "libsoxr-dev" "libsuil-dev" "libtwolame-dev" "vamp-plugin-sdk" "libvorbis-dev" "lv2-dev" "zlib1g-dev" "cmake" "ninja-build" "libjpeg-dev" "libtiff-dev" "liblzma-dev" "libsqlite3-dev" "libwxgtk3.2-dev" "libjsoncpp-dev" "libzip-dev" "zipcmp" "zipmerge" "ziptool" "libzip4" "gettext")
depends=("libc6" "libexpat1" "libgcc-s1" "libgdk-pixbuf-2.0-0" "libglib2.0-0" "libgtk-3-0" "libid3tag0" "liblilv-0-0" "libmad0" "libogg0" "libportaudio2" "libsndfile1" "libsoundtouch1" "libsoxr0" "libstdc++6" "libsuil-0-0" "libtwolame0" "libvamp-hostsdk3v5" "libvorbis0a" "libvorbisenc2" "libvorbisfile3")
codename="$(lsb_release -cs)"
case "${codename}" in
  bookworm)
    depends+=("libavcodec59" "libavformat59" "libavutil57" "libflac++10" "libflac12" "libportsmf0" "libwxbase3.2-1" "libwxgtk3.2-1")
    ;;
  kinetic)
    depends+=("libavcodec59" "libavformat59" "libavutil57" "libflac++6v5" "libflac8" "libportsmf0v5" "libwxbase3.2-0" "libwxgtk3.2-0")
    ;;
  lunar)
    depends+=("libavcodec59" "libavformat59" "libavutil57" "libflac++10" "libflac8" "libportsmf0v5" "libwxbase3.2-0" "libwxgtk3.2-0")
    ;;
  *)
    depends+=("libavcodec60" "libavformat60" "libavutil58" "libflac++10" "libflac12" "libportsmf0v5" "libwxbase3.2-1" "libwxgtk3.2-1")
    ;;
esac
replaces=("audacity")
pkgdesc="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"

optdepends=("ffmpeg: additional import/export capabilities")
maintainer=("echometerain <echometer@disroot.org>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "debian:stretch" "debian:buster" "debian:bullseye")

modern=("devel" "sid" "lunar" "bookworm" "mantic" "noble" "trixie" "testing" "unstable")
# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${codename} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

prepare() {
  cd "${_archive}"
  pip3 install conan "${pyhack[@]}"
}

build() {
  cd "${_archive}"
  cmake -G Ninja -S . -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr/local"
  cmake --build build
}

package() {
  cd "${_archive}"
  cmake --install build
}
