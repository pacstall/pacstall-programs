pkgname="tenacity-git"
gives="tenacity"
source=("git+https://codeberg.org/tenacityteam/tenacity.git"
  "tenacity-libnyquist::git+https://codeberg.org/tenacityteam/libnyquist.git")
pkgver="1.3.3"
arch=("any")
pkgdesc="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"
makedepends=("clang" "chrpath" "cmake" "pkg-config" "libelf-dev" "libavcodec-dev" "libavformat-dev" "libavutil-dev" "libavdevice-dev" "libavfilter-dev" "libpostproc-dev" "libportsmf-dev" "libflac++-dev" "libglib2.0-dev" "libgtk-3-dev" "libid3tag0-dev" "libjack-jackd2-dev" "liblilv-dev" "libmad0-dev" "libmp3lame-dev" "libogg-dev" "libpng-dev" "portaudio19-dev" "libportmidi-dev" "libserd-dev" "libsndfile1-dev" "libsord-dev" "libsoundtouch-dev" "libsoxr-dev" "libsuil-dev" "libtwolame-dev" "vamp-plugin-sdk" "libvorbis-dev" "lv2-dev" "zlib1g-dev" "cmake" "libjpeg-dev" "libtiff-dev" "liblzma-dev" "libsqlite3-dev" "libwxgtk3.2-dev" "libjsoncpp-dev" "libzip-dev" "zipcmp" "zipmerge" "ziptool" "gettext")

depends=("libc6" "libexpat1" "libgcc-s1" "libgdk-pixbuf-2.0-0" "libglib2.0-0" "libgtk-3-0" "libid3tag0" "liblilv-0-0" "libmad0" "libogg0" "libportaudio2" "libsndfile1" "libsoundtouch1" "libsoxr0" "libstdc++6" "libsuil-0-0" "libtwolame0" "libvamp-hostsdk3v5" "libvorbis0a" "libvorbisenc2" "libvorbisfile3" "libportmidi0" "libzip-dev" "libjsoncpp-dev" "libavcodec-dev" "libavformat-dev" "libavutil-dev" "libflac++10" "libflac12" "libportsmf-dev" "libwxbase3.2-1" "libwxgtk3.2-1")

optdepends=("ffmpeg: additional import/export capabilities")
maintainer=("echometerain <echometer@disroot.org>" "xdavius <xdavius@github.com>")
external_connection=true

prepare() {
  cd tenacity
  git submodule init
  git config submodule.vcpkg.update none
  git config submodule.lib-src/libnyquist.url "${srcdir}/tenacity-libnyquist"
  git -c protocol.file.allow=always submodule update

  cd images/icons
  for i in *; do # fix for png icons not following hicolor category folders
    cd "${i}"
    mkdir -p apps
    [[ -f tenacity.png ]] && mv tenacity.png apps
    cd ..
  done
  cd ../..
  mkdir -p build
}

build() {
  cd tenacity/build
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -Wno-dev \
    ..
  cmake --build .
  make -j"${NCPU}" .
}

package() {
  cd tenacity/build
  make DESTDIR="${pkgdir}" install
  [[ -f "${pkgdir}/usr/tenacity" ]] && rm "${pkgdir}/usr/tenacity" # remove unused launch script

  mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
    "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  chrpath --delete "${pkgdir}"/usr/lib/x86_64-linux-gnu/tenacity/*.so
  chrpath --delete "${pkgdir}"/usr/lib/x86_64-linux-gnu/tenacity/modules/*.so
}
