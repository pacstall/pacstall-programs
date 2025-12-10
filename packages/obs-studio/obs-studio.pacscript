pkgname="obs-studio"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="32.0.3"
source=(
  "https://github.com/obsproject/obs-studio.git#tag=${pkgver}"
  "https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64.tar.xz"
)
sha256sums=(
  'SKIP'
  "fab66dfc9cfd2e26fb87798f855aef30c2004edc8e19570d37af555644ae1655"
)
depends=(
  "libasound2t64" "libatk-bridge2.0-0t64" "libatk1.0-0t64" "libatspi2.0-0t64" "libavcodec61 | libavcodec60 | libavcodec58"
  "libavdevice61 | libavdevice60 | libavdevice58" "libavformat61 | libavformat60 | libavformat58" "libavutil59 | libavutil58 | libavutil56" "libc6" "libcups2t64"
  "libcurl4t64" "libdbus-1-3" "libdrm2" "libegl1" "libexpat1"
  "libfontconfig1" "libfreetype6" "libgbm1" "libgcc-s1"
  "libglib2.0-0t64" "libglx0" "libjack-jackd2-0 | libjack-0.125" "libjansson4" "libluajit-5.1-2 | libluajit-5.1-2"
  "libmbedcrypto16 | libmbedcrypto7t64" "libmbedtls14t64 | libmbedtls21" "libmbedx509-7 | libmbedx509-1t64" "libnspr4" "libnss3"
  "libopengl0" "libpci3" "libpipewire-0.3-0t64" "libpulse0" "libpython3.13 | libpython3.12t64"
  "libqrcodegencpp1" "libqt6core6t64" "libqt6dbus6" "libqt6gui6" "libqt6network6"
  "libqt6svg6" "libqt6widgets6" "libqt6xml6" "librist4" "libspeexdsp1"
  "libsrt1.5-openssl" "libstdc++6" "libswresample5 | libswresample4 | libswresample3" "libswscale8 | libswscale7 | libswscale5" "libudev1"
  "libuuid1" "libv4l-0t64" "libva-drm2" "libva2" "libvpl2"
  "libwayland-client0" "libwayland-egl1" "libx11-6" "libx11-xcb1"
  "libx264-164" "libxcb-composite0" "libxcb-randr0" "libxcb-shm0" "libxcb-xfixes0"
  "libxcb-xinerama0" "libxcb1" "libxcomposite1" "libxdamage1" "libxext6"
  "libxfixes3" "libxkbcommon0" "libxrandr2" "zlib1g" "qt6-wayland" "qt6-qpa-plugins"
)
makedepends=(
  # System dependencies
  "cmake" "extra-cmake-modules" "ninja-build" "pkg-config" "clang" "clang-format"
  "build-essential" "curl" "ccache" "zsh" "libnss3-dev"

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
  "libasound2-dev" "libfontconfig-dev" "libfreetype6-dev" "libjack-jackd2-dev"
  "libpulse-dev" "libsndio-dev" "libspeexdsp-dev" "libudev-dev" "libv4l-dev"
  "libva-dev" "libvlc-dev" "libvpl-dev" "libdrm-dev" "nlohmann-json3-dev"
  "libwebsocketpp-dev" "libasio-dev" "libffmpeg-nvenc-dev"
)
optdepends=(
  "libfdk-aac2t64 | libfdk-aac2: FDK AAC codec support"
  "sndiod: sndio input client"
  "v4l2loopback-dkms: Virtual camera support"
  "vlc: VLC Media Source"
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
