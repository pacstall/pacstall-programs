pkgname="ffmpeg"
pkgver="9.0.2"
arch=("amd64")
url='https://ffmpeg.org'
repology=("project: ${pkgname}")
maintainer=("Sarim <sarimw@proton.me>" "pejuton <pejuton@proton.me>")
breaks=("ffmpeg4.4")
conflicts=("ffmpeg4.4")
pkgdesc="Complete, cross-platform solution to record, convert and stream audio and video"
pacdeps_debian=("libfdk-aac-dev-deb") # available in non-free archives
pacdeps_jammy=("libfdk-aac-dev-deb")  # available in multiverse repository
makedepends_ubuntu=("libfdk-aac-dev")
makedepends=("autoconf"
  "automake"
  "cmake"
  "meson"
  "wget"
  "yasm"
  "nasm"
  "libtool"
  "texinfo"
  "git-core"
  "libva-dev"
  "pkg-config"
  "libaom-dev"
  "libass-dev"
  "zlib1g-dev"
  "libaom-dev"
  "libvpx-dev"
  "libxcb1-dev"
  "libsdl2-dev"
  "ninja-build"
  "libx264-dev"
  "libnuma-dev"
  "libx265-dev"
  "libopus-dev"
  "libvdpau-dev"
  "libdav1d-dev"
  "libvorbis-dev"
  "libmp3lame-dev"
  "libgnutls28-dev"
  "build-essential"
  "libxcb-shm0-dev"
  "libfreetype6-dev"
  "libsvtav1enc-dev"
  "libunistring-dev"
  "libxcb-xfixes0-dev")
source=("https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n${pkgver}.tar.gz")
sha256sums=("6e374ed621e48faa40639307dff48ba6fe574a509977956d2cce9669b7cc27e9")

prepare() {
  cd "FFmpeg-n${pkgver}"
  ./configure --pkg-config-flags="--static" \
    --extra-libs="-lpthread -lm" \
    --ld="g++" \
    --enable-gpl \
    --enable-gnutls \
    --enable-libvpx \
    --enable-libass \
    --enable-libaom \
    --enable-nonfree \
    --enable-libopus \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libdav1d \
    --enable-libsvtav1 \
    --enable-libvorbis \
    --enable-libmp3lame \
    --enable-libfdk-aac \
    --enable-libfreetype
}

build() {
  cd "FFmpeg-n${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "FFmpeg-n${pkgver}"
  make install DESTDIR="${pkgdir}"
}
