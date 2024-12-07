pkgname="libcamera-git"
gives="libcamera"
arch=("any")
pkgver="0.1.0"
source=("https://git.libcamera.org/libcamera/libcamera.git")
makedepends=("build-essential" "ninja-build" "pkg-config" "libyaml-dev" "python3-yaml" "python3-ply" "python3-jinja2" "libssl-dev" "openssl" "libdw-dev" "libunwind-dev" "libudev-dev" "python3-sphinx" "doxygen" "graphviz" "texlive-latex-extra" "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libdrm-dev" "libjpeg-dev" "libsdl2-dev" "libexif-dev" "qtbase5-dev" "libqt5core5a" "libqt5gui5" "libqt5widgets5" "qttools5-dev-tools" "libtiff-dev" "liblttng-ust-dev" "python3-jinja2" "lttng-tools")
pacdeps_focal=("meson-focal-deb")
if [[ ${DISTRO#*:} != "focal" ]]; then
  makedepends+=("meson")
fi
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Open source camera stack and framework"

build() {
  cd "libcamera"
  meson setup build
  ninja -C build -j"${NCPU}"
}

package() {
  cd "libcamera"
  DESTDIR="${pkgdir}" ninja -C build install
}
