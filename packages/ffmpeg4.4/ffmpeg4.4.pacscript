pkgname=ffmpeg4.4
arch=("any")
pkgver=4.4.4
pkgdesc='Complete solution to record, convert and stream audio and video'
url=https://ffmpeg.org/
source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg4.4/-/raw/main/binutils-2.41.patch")
makedepends=("pkg-config" "nasm" "gnutls-dev" "libdrm-dev" "libfontconfig-dev" "libpulse-dev" "libx264-164" "libx264-dev")
maintainer=("Elsie19 <hwengerstickel@pm>")

prepare() {
  cd ffmpeg
  patch -p1 -i ../binutils-2.41.patch # Fix build with binutils 2.41
}

build() {
  cd ffmpeg
  ./configure \
    --prefix=/usr \
    --incdir=/usr/include/ffmpeg4.4 \
    --libdir=/usr/lib/ffmpeg4.4 \
    --disable-debug \
    --disable-doc \
    --disable-programs \
    --disable-static \
    --disable-stripping \
    --enable-lto \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libpulse \
    --enable-shared \
    --enable-libx264 \
    --enable-version3

  make -j"${NCPU}"
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install
  cd "${pkgdir}"
  # Move libs to /usr/lib, except the .so symlinks
  local f
  for f in usr/lib/ffmpeg4.4/*; do
    if [[ ${f} == *.so ]]; then
      ln -srfv -- usr/lib/"$(readlink "${f}")" "${f}"
    elif [[ ! -d ${f} ]]; then
      mv -v "${f}" usr/lib
    fi
  done
  rm -rv usr/share
}
