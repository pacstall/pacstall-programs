pkgname="obs-studio"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="31.0.3"
source=(
  "https://github.com/obsproject/obs-studio.git#tag=${pkgver}"
  "https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64.tar.xz"
)
sha256sums=(
  'SKIP'
  "fab66dfc9cfd2e26fb87798f855aef30c2004edc8e19570d37af555644ae1655"
)
depends=(
  "libasound2t64>=1.0.17" "libatk-bridge2.0-0t64>=2.5.3" "libatk1.0-0t64>=2.2.0" "libatspi2.0-0t64>=2.9.90" "libavcodec61>=7:7.0 | libavcodec60 | libavcodec58"
  "libavdevice61>=7:7.0 | libavdevice60 | libavdevice58" "libavformat61>=7:7.0 | libavformat60 | libavformat58" "libavutil59>=7:7.0 | libavutil58 | libavutil56" "libc6>=2.38" "libcups2t64>=1.7.0"
  "libcurl4t64>=7.16.2" "libdbus-1-3>=1.9.14" "libdrm2>=2.4.75" "libegl1" "libexpat1>=2.1~beta3"
  "libfontconfig1>=2.12.6" "libfreetype6>=2.2.1" "libgbm1>=17.1.0~rc2" "libgcc-s1>=3.3.1"
  "libglib2.0-0t64>=2.40.0" "libglx0" "libjack-jackd2-0>=1.9.10+20150825 | libjack-0.125" "libjansson4>=2.14" "libluajit-5.1-2>=2.0.4 | libluajit-5.1-2>=2.1.0+openresty"
  "libmbedcrypto16 | libmbedcrypto7t64>=2.28" "libmbedtls14t64>=2.28 | libmbedtls21" "libmbedx509-7 | libmbedx509-1t64>=2.28" "libnspr4>=2:4.9-2~" "libnss3>=2:3.31"
  "libopengl0" "libpci3>=1:3.7.0" "libpipewire-0.3-0t64>=0.3.6" "libpulse0>=0.99.1" "libpython3.13 | libpython3.12t64>=3.12.1"
  "libqrcodegencpp1>=1.2.1" "libqt6core6t64>=6.4.2" "libqt6dbus6>=6.3.0" "libqt6gui6>=6.4.0" "libqt6network6>=6.1.2"
  "libqt6svg6>=6.2.4" "libqt6widgets6>=6.3.0" "libqt6xml6>=6.2.4" "librist4>=0.2.6+dfsg" "libspeexdsp1>=1.2.1"
  "libsrt1.5-openssl>=1.5.3" "libstdc++6>=14" "libswresample5>=7:7.0 | libswresample4 | libswresample3" "libswscale8>=7:7.0 | libswscale7 | libswscale5" "libudev1>=183"
  "libuuid1>=2.16" "libv4l-0t64>=0.5.0" "libva-drm2>= 1.1.0" "libva2>=2.2.0" "libvpl2>=1:2.13.0 | libvpl2>=2022.1.0-2"
  "libwayland-client0>=1.20.0" "libwayland-egl1>=1.15.0" "libx11-6>=2:1.4.99.1" "libx11-xcb1>=2:1.8.7"
  "libx264-164>=2:0.164.3108+git31e19f9" "libxcb-composite0" "libxcb-randr0>=1.12" "libxcb-shm0" "libxcb-xfixes0"
  "libxcb-xinerama0" "libxcb1>=1.9.2" "libxcomposite1>=1:0.4.5" "libxdamage1>=1:1.1" "libxext6"
  "libxfixes3" "libxkbcommon0>=0.5.0" "libxrandr2" "zlib1g>=1:1.1.4" "qt6-wayland" "qt6-qpa-plugins"
)
makedepends=(
  # System dependencies
  "cmake" "ninja-build" "pkg-config" "clang" "clang-format"
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
optdepends=("libfdk-aac2t64 | libfdk-aac2>=2.0.1: Standalone library of the Fraunhofer FDK AAC code from Android")
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
