pkgname="ffmpeg"
pkgver="8.0"
arch=("amd64")
url='https://ffmpeg.org'
repology=("project: ${pkgname}")
maintainer=("Sarim <sarimw@proton.me>")
breaks=("ffmpeg4.4")
conflicts=("ffmpeg4.4")
pkgdesc="Complete, cross-platform solution to record, convert and stream audio and video"
pacdeps=("libfdk-aac-dev-deb")
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
  "libx265-dev"
  "libopus-dev"
  "libvdpau-dev"
  "libdav1d-dev"
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
sha256sums=("dd4030dbfdc34d9ff255a116bdd1caade42500ac2981efa27f8b151cc54c7b9e")

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
