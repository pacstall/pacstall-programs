pkgname="stellarium"
arch=("any")
pkgver="26.2"
source=("@${pkgname}~${pkgver}::https://github.com/Stellarium/stellarium/releases/download/v${pkgver}/stellarium-${pkgver}.tar.xz")
maintainer=("Elsie19 <elsie19@pm.me>")
makedepends=("cmake" "zlib1g-dev" "libgl1-mesa-dev" "libdrm-dev" "gcc" "g++" "graphviz" "doxygen" "gettext" "libxkbcommon-x11-dev" "libgps-dev" "gstreamer1.0-plugins-base" "gstreamer1.0-plugins-good" "gstreamer1.0-pulseaudio" "gstreamer1.0-libav" "gstreamer1.0-vaapi" "qt6-base-private-dev" "qt6-multimedia-dev" "qt6-positioning-dev" "qt6-tools-dev" "qt6-tools-dev-tools" "qt6-base-dev-tools" "qt6-qpa-plugins" "qt6-image-formats-plugins" "qt6-l10n-tools" "qt6-webengine-dev" "qt6-webengine-dev-tools" "libqt6charts6-dev" "libqt6charts6" "libqt6opengl6-dev" "libqt6positioning6-plugins" "qt6-serialport-dev" "qt6-base-dev" "libqt6webenginecore6-bin" "libqt6webengine6-data" "qml6-module-qtcharts")
pkgdesc="Free open source planetarium for your computer
It shows a realistic sky in 3D, just like what you see with the naked eye, binoculars or a telescope"
sha256sums=("9a068d00aac82151f2b24c7f278847a2f9416f31f17c0326fc56ee4cc4cb1aed")
repology=("project: stellarium")
external_connection=true

build() {
  local cmake_options=(
    -B build
    -S "${pkgname}~${pkgver}"
    -W no-dev
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 # Necessary for CMake 4+
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_C_EXTENSIONS=Yes
    -D CMAKE_C_STANDARD=17
    -D CMAKE_CXX_EXTENSIONS=Yes
    -D CPM_LOCAL_PACKAGES_ONLY=ON
    -D ENABLE_LTO=1
  )
  cmake "${cmake_options[@]}"
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -vDm 655 "${pkgname}~${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}
