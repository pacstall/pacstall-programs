pkgname="lmms-git"
gives="lmms"
pkgver="1.3.0.alpha.1.r857.gbbdfeff5e"
pkgdesc='For making music with your computer by creating melodies, beats, sounds and samples. It supports VST and SoundFont plugins, MIDI and Hydrogen files, and has a user-friendly interface with various editors and automation features.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL-2.0')
depends=(
  'libsndfile1-dev'
  'libsamplerate0-dev'
  'libasound2-dev'
  'libstk-dev'
  'libsdl1.2-dev'
  'portaudio19-dev'
  'libjack-dev'
  'ladspa-sdk'
  'libvorbis-dev'
  'libfltk1.3-dev'
  'libpulse-dev'
  'libfluidsynth-dev'
  'libfftw3-dev'
  'libgig-dev'
  'libmp3lame-dev'
  'libqt5svg5-dev'
  'libqt5x11extras5-dev'
  'libxcb-keysyms1-dev'
  'libxcb-util0-dev'
  'libx11-xcb-dev'
)

optdepends=(
  'pulseaudio: pulseaudio support'
  'wine: VST plugin support'
  'carla: carla support'
)

makedepends=(
  'cmake'
  'wine'
  'git'
  'fluid'
  'qttools5-dev'
  'qtbase5-private-dev'
  'gcc-multilib'
  'g++-multilib'
  'libwine-dev:i386'
  'libxml-parser-perl'
  'liblist-moreutils-perl'
)

provides=("${gives}")
conflicts=("${gives}" "${gives}-git" )
source=("https://github.com/LMMS/${gives}.git"
        'https://github.com/Lukas-W/qt5-x11embed.git'
        'https://github.com/rampantpixels/rpmalloc.git')

maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"
  mkdir -vp build
  git submodule init
  git config submodule.src/3rdparty/qt5-x11embed.url "${srcdir}/qt5-x11embed"
  git config submodule.src/3rdparty/rpmalloc.url "${srcdir}/rpmalloc"
  git -c protocol.file.allow=always submodule update
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
    -DCMAKE_PREFIX_PATH="/usr/include/wine/windows" \
    -DQt5Svg_DIR=/usr/lib/x86_64-linux-gnu/cmake/Qt5Svg \
    -DWINE_INCLUDE_DIR=/usr/include/wine/windows \
    -DWINE_LIBRARY=/usr/lib32/wine \
    ..
  cmake --build .
}

package() {
  cd "${gives}/build"
  make DESTDIR="${pkgdir}" install
  desktop_link="https://raw.githubusercontent.com/LMMS/lmms/refs/heads/master/cmake/linux/lmms.desktop"
  curl -L -o lmms.desktop ${desktop_link} || wget -O lmms.desktop ${desktop_link}
  install -Dm755 "lmms.desktop" -t "${pkgdir}/usr/share/applications"
}
