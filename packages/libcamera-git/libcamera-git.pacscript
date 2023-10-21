name="libcamera-git"
gives="libcamera"
pkgver="0.1.0"
url="https://git.libcamera.org/libcamera/libcamera.git"
if [[ "$(lsb_release -cs)" == "focal" ]]; then
  pacdeps=("meson-focal-deb")
else
  MESON="meson"
fi
makedepends=("build-essential" "ninja-build" "pkg-config" "libyaml-dev" "python3-yaml" "python3-ply" "python3-jinja2" "libssl-dev" "openssl" "libdw-dev" "libunwind-dev" "libudev-dev" "python3-sphinx" "doxygen" "graphviz" "texlive-latex-extra" "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libdrm-dev" "libjpeg-dev" "libsdl2-dev" "libexif-dev" "qtbase5-dev" "libqt5core5a" "libqt5gui5" "libqt5widgets5" "qttools5-dev-tools" "libtiff-dev" "liblttng-ust-dev" "python3-jinja2" "lttng-tools")
if [[ -n ${MESON} ]]; then
  makedepends+=("${MESON}")
fi
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Open source camera stack and framework"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  sudo meson setup build
  sudo ninja -C build -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
