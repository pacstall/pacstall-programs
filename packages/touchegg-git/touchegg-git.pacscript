pkgname="touchegg-git"
gives="touchegg"
source=("https://github.com/JoseExposito/touchegg.git")
arch=("any")
pkgver="2.0.16"
makedepends=("git" "build-essential" "gdb" "cmake" "debhelper" "libudev-dev" "libinput-dev" "libpugixml-dev" "libcairo2-dev" "libx11-dev" "libxtst-dev" "libxrandr-dev" "libxi-dev" "libglib2.0-dev" "libgtk-3-dev")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
pkgdesc="Touchégg is an app that runs in the background and transform the gestures you make on your touchpad or touchscreen into visible actions in your desktop."
maintainer=("Zahrun <zahrunAtmurenaDotio>")

build() {
  cd "touchegg"
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j"${NCPU}"
}

package() {
  cd "touchegg"
  make install DESTDIR="${pkgdir}"
  cd "${pkgdir}"
  mv usr/local/etc .
}

post_install() {
  sudo systemctl daemon-reload && sudo systemctl enable touchegg --now
}
