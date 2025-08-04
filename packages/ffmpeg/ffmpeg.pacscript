pkgname="ffmpeg"
pkgver="7.1.1"
arch=("amd64")
url='https://ffmpeg.org'
repology=("project: ${pkgname}")
maintainer=("Sarim <sarimw@proton.me>")
breaks=("ffmpeg4.4")
conflicts=("ffmpeg4.4")
pkgdesc="Complete, cross-platform solution to record, convert and stream audio and video"
pacdeps=("libfdk-aac2-deb")
makedepends=("autoconf" "automake" "build-essential" "cmake" "git-core" "libass-dev" "libfreetype6-dev" "libgnutls28-dev" "libmp3lame-dev" "libsdl2-dev" "libtool" "libva-dev" "libvdpau-dev" "libvorbis-dev" "libxcb1-dev" "libxcb-shm0-dev" "libxcb-xfixes0-dev" "meson" "ninja-build" "pkg-config" "texinfo" "wget" "yasm" "zlib1g-dev" "libx264-dev" "libunistring-dev" "libaom-dev" "libdav1d-dev" "nasm" "libx265-dev" "libx265-dev" "libnuma-dev" "libvpx-dev" "libopus-dev" "libaom-dev" "libsvtav1enc-dev" "libdav1d-dev")
source=("https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n${pkgver}.tar.gz")
sha256sums=("f117507dc501f2a6c11f9241d8d0c3213846cfad91764361af37befd6b6c523d")

prepare() {
  cd "FFmpeg-n${pkgver}"
  ./configure --pkg-config-flags="--static" --extra-libs="-lpthread -lm" --ld="g++" --enable-gpl --enable-gnutls --enable-libaom --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libsvtav1 --enable-libdav1d --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-nonfree
}

build() {
  cd "FFmpeg-n${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "FFmpeg-n${pkgver}"
  make install DESTDIR="${pkgdir}"
}
