pkgname="lmms-git"
gives="lmms"
pkgver="1.3.0.alpha.1.r857.gbbdfeff5e"
pkgdesc='For making music with your computer by creating melodies, beats, sounds and samples. It supports VST and SoundFont plugins, MIDI and Hydrogen files, and has a user-friendly interface with various editors and automation features.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL-2.0')
maintainer=("aKqir24 <aKqir24@github.com>")
depends=(
  'git'
  'fluid'
  'libvorbis-dev'
  'portaudio19-dev'
  'libjack-dev'
<<<<<<< HEAD
  'ladspa-sdk'
  'libvorbis-dev'
  'libfltk1.3-dev'
  'libpulse-dev'
  'libfluidsynth-dev'
  'libfftw3-dev'
  'libgig-dev'
  'libmp3lame-dev'
<<<<<<< HEAD
  'libqt5svg5-dev'
  'libqt5x11extras5-dev'
=======
>>>>>>> 56b7b063 (Qt5 fix)
=======
  'libxml-parser-perl'
  'liblist-moreutils-perl'
>>>>>>> 587a7c3a (depends and make deps organazation)
  'libxcb-keysyms1-dev'
  'libxcb-util0-dev'
)

optdepends=(
  'pulseaudio: pulseaudio support'
  'wine: VST plugin support'
  'carla: carla support'
)

makedepends=(
  'cmake'
  'wine'
<<<<<<< HEAD
  'git'
  'fluid'
<<<<<<< HEAD
=======
=======
>>>>>>> 587a7c3a (depends and make deps organazation)
  'libqt5svg5-dev'
  'libqt5x11extras5-dev'
>>>>>>> 56b7b063 (Qt5 fix)
  'qttools5-dev'
  'qtbase5-private-dev'
  'gcc-multilib'
  'g++-multilib'
  'libwine-dev:i386'
  'libsndfile1-dev'
  'libsamplerate0-dev'
  'libasound2-dev'
  'libstk-dev'
  'libsdl1.2-dev'
  'ladspa-sdk'
  'libfltk1.3-dev'
  'libpulse-dev'
  'libfluidsynth-dev'
  'libfftw3-dev'
  'libgig-dev'
  'libmp3lame-dev'
  'libx11-xcb-dev'
)

<<<<<<< HEAD
provides=('lmms')
conflicts=('lmms' 'lmms-git')
source=("git+https://github.com/LMMS/${gives}.git"
  'git+https://github.com/Lukas-W/qt5-x11embed.git'
  'git+https://github.com/rampantpixels/rpmalloc.git')
=======
provides=("${gives}")
conflicts=("${gives}" "${gives}-git")
source=("https://github.com/LMMS/${gives}.git"
<<<<<<< HEAD
        'https://github.com/Lukas-W/qt5-x11embed.git'
        'https://github.com/rampantpixels/rpmalloc.git')
>>>>>>> 003a88c4 (Desktop shortcut from repo)
=======
  'https://github.com/Lukas-W/qt5-x11embed.git'
  'https://github.com/rampantpixels/rpmalloc.git')
>>>>>>> dc185bc1 (Remove not needed commits)

maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"
  mkdir -vp build
  git submodule init
  git config submodule.src/3rdparty/qt5-x11embed.url "${srcdir}/qt5-x11embed"
  git config submodule.src/3rdparty/rpmalloc.url "${srcdir}/rpmalloc"
  git -c protocol.file.allow=always submodule update
  # setting lib dir
  sed -e 's|lib64|lib|g' -i cmake/modules/DetectMachine.cmake
  sed -e 's/\(${BASHCOMP_USER\)/\1/g' -i cmake/modules/BashCompletion.cmake
}

build() {
  cd "${gives}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_QT5=ON \
    -DWANT_SOUNDIO=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_MODULE_PATH=/usr/share/ECM/find-modules \
    -DCMAKE_PREFIX_PATH=/usr/include/wine/windows \
    -DWINE_INCLUDE_DIR=/usr/include/wine/windows \
    -DWINE_LIBRARY=/usr/lib32/wine \
    ..
  #actually aknowledge other defaults
  cmake --build .
}

package() {
  cd "${gives}/build"
  make DESTDIR="${pkgdir}" install
  cd "${gives}/cmake/linux"
  install -Dm755 "lmms.desktop" -t "${pkgdir}/usr/share/applications"
}
