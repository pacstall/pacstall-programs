pkgname="lmms-git"
gives="lmms"
pkgver="1.3.0.alpha.1.r857.gbbdfeff5e"
pkgdesc="Make music with your computer by creating melodies, beats, sounds and samples"
arch=('x86_64')
url='https://lmms.io'
license=('GPL-2.0')
maintainer=("aKqir24 <aKqir24@github.com>")
depends=(
  'fluid'
  'libjack-dev'
  'libpulse-dev'
  'libvorbis-dev'
  'libqt6gui6'
  'libqt6widgets6'
  'libqt6core6'
)
optdepends=(
  'pulseaudio: pulseaudio support'
  'wine: VST plugin support'
  'libogg-dev: Multimedia container format'
  'carla: carla support'
)
makedepends=(
  'cmake'
  'libfltk1.3-dev'
  'libstk-dev'
  'libqt6core5compat6-dev'
  'libqt6svg6-dev'
  'qt6-base-dev'
  'qt6-tools-dev'
  'libsndfile1-dev'
  'libsamplerate0-dev'
  'libasound2-dev'
  'libsdl2-dev'
  'libfluidsynth-dev'
  'portaudio19-dev'
  'ladspa-sdk'
  'libfftw3-dev'
  'libgig-dev'
  'libmp3lame-dev'
  'libxcb-keysyms1-dev'
  'libxcb-util0-dev'
  'libx11-xcb-dev'
  'gcc-multilib'
  'g++-multilib'
  'libwine-dev:i386'
  'libxml-parser-perl'
  'liblist-moreutils-perl'
)
provides=("${gives}")
conflicts=("${gives}" "${pkgname}")
source=("https://github.com/LMMS/${gives}.git"
  'https://github.com/Lukas-W/qt5-x11embed.git'
  'https://github.com/rampantpixels/rpmalloc.git')
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"
  mkdir -vp build
  git submodule init
  git config submodule.src/3rdparty/rpmalloc.url "${srcdir}/rpmalloc"
  git config --unset submodule.src/3rdparty/qt5-x11embed.url || true
  git -c protocol.file.allow=always submodule update
  sed -e 's|lib64|lib|g' -i cmake/modules/DetectMachine.cmake
  sed -e "s/\(${BASHCOMP_USER}\)/\1/g" -i cmake/modules/BashCompletion.cmake
}

build() {
  cd "${gives}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_VST=ON \
    -DWANT_QT6=ON \
    -DWANT_WINE=ON \
    -DWANT_VST_32=0N \
    -DWANT_VST_64=0N \
    -DWANT_SOUNDIO=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=/usr/share/ECM/find-modules \
    -DCMAKE_PREFIX_PATH=/usr/include/wine/windows \
    -DWINE_INCLUDE_DIR=/usr/include/wine/windows \
    -DWINE_LIBRARY=/usr/lib32/wine \
    ..
  # Actually acknowledge other defaults
  cmake --build . --parallel "${NCPU}"
}

package() {
  cd "lmms/build"
  make DESTDIR="${pkgdir}" install
  install -Dm755 "../cmake/linux/lmms.desktop" -t "${pkgdir}/usr/share/applications"
}
