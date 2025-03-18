pkgname="obs-studio"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="31.0.2"
source=(
  "https://github.com/obsproject/obs-studio.git#tag=${pkgver}"
  "https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64.tar.xz"
)
sha256sums=(
  'SKIP'
  "fab66dfc9cfd2e26fb87798f855aef30c2004edc8e19570d37af555644ae1655"
)
makedepends=(
  # System dependencies
  "cmake" "ninja-build" "pkg-config" "clang" "clang-format"
  "build-essential" "curl" "ccache" "zsh"

  # OBS core dependencies
  "libavcodec-dev" "libavdevice-dev" "libavfilter-dev" "libavformat-dev" "libavutil-dev"
  "libswresample-dev" "libswscale-dev" "libx264-dev" "libcurl4-openssl-dev" "libmbedtls-dev"
  "libgl1-mesa-dev" "libjansson-dev" "libluajit-5.1-dev" "python3-dev" "libx11-dev"
  "libxcb-randr0-dev" "libxcb-shm0-dev" "libxcb-xinerama0-dev" "libxcb-composite0-dev" "libxcomposite-dev"
  "libxinerama-dev" "libxcb1-dev" "libx11-xcb-dev" "libxcb-xfixes0-dev" "swig"
  "libcmocka-dev" "libxss-dev" "libglvnd-dev" "libgles2-mesa-dev" "libwayland-dev"
  "librist-dev" "libsrt-openssl-dev" "libpci-dev" "libpipewire-0.3-dev" "libqrcodegencpp-dev"
  "uthash-dev"

  # Qt6 dependencies
  "qt6-base-dev" "qt6-base-private-dev" "qt6-svg-dev" "qt6-wayland" "qt6-image-formats-plugins"

  # Plugin dependencies
  "libasound2-dev" "libfdk-aac-dev" "libfontconfig-dev" "libfreetype6-dev" "libjack-jackd2-dev"
  "libpulse-dev" "libsndio-dev" "libspeexdsp-dev" "libudev-dev" "libv4l-dev"
  "libva-dev" "libvlc-dev" "libvpl-dev" "libdrm-dev" "nlohmann-json3-dev"
  "libwebsocketpp-dev" "libasio-dev" "libffmpeg-nvenc-dev"
)
pacdeps=("rnnoise")
pkgdesc="Free and open source software for live streaming and screen recording"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-2.0-only')

prepare() {
  cd "${pkgname}"
  cmake --preset ubuntu -DOBS_COMPILE_DEPRECATION_AS_WARNING=ON -DENABLE_RELOCATABLE=ON -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DENABLE_BROWSER=ON -DCEF_ROOT_DIR="${srcdir}/cef_binary_6533_linux_x86_64"
}

build() {
  cd "${pkgname}"
  cmake --build build_ubuntu
}

package() {
  cd "${pkgname}"
  cmake --install build_ubuntu
}
