pkgname="stellarium"
arch=("any")
pkgver="25.1"
source=("@${pkgname}~${pkgver}::https://github.com/Stellarium/stellarium/releases/download/v${pkgver}/stellarium-${pkgver}.tar.xz")
maintainer=("Elsie19 <elsie19@pm.me>")
makedepends=("cmake" "zlib1g-dev" "libgl1-mesa-dev" "libdrm-dev" "gcc" "g++" "graphviz" "doxygen" "gettext" "libxkbcommon-x11-dev" "libgps-dev" "gstreamer1.0-plugins-base" "gstreamer1.0-plugins-good" "gstreamer1.0-pulseaudio" "gstreamer1.0-libav" "gstreamer1.0-vaapi" "qt6-base-private-dev" "qt6-multimedia-dev" "qt6-positioning-dev" "qt6-tools-dev" "qt6-tools-dev-tools" "qt6-base-dev-tools" "qt6-qpa-plugins" "qt6-image-formats-plugins" "qt6-l10n-tools" "qt6-webengine-dev" "qt6-webengine-dev-tools" "libqt6charts6-dev" "libqt6charts6" "libqt6opengl6-dev" "libqt6positioning6-plugins" "qt6-serialport-dev" "qt6-base-dev" "libqt6webenginecore6-bin" "libqt6webengine6-data" "qml6-module-qtcharts")
pkgdesc="Stellarium is a free open source planetarium for your computer. It shows a realistic sky in 3D, just like what you see with the naked eye, binoculars or a telescope."
sha256sums=("610384311455ce75f9b02f0d3d50e5cc127c36e67008817ea8cbab0bdadeaf5a")
external_connection=true

build() {
  cd "${pkgname}~${pkgver}"
  mkdir -p build/unix
  cd build/unix
  cmake -DCMAKE_INSTALL_PREFIX="/opt/stellarium" ../..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cd build/unix
  make install -j"${NCPU}" DESTDIR="${pkgdir}"
}
