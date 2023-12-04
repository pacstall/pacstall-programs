name="touchegg-git"
gives="touchegg"
url="https://github.com/JoseExposito/touchegg.git"
pkgver="2.0.16"
makedepends=("git" "build-essential" "gdb" "cmake" "debhelper" "libudev-dev" "libinput-dev" "libpugixml-dev" "libcairo2-dev" "libx11-dev" "libxtst-dev" "libxrandr-dev" "libxi-dev" "libglib2.0-dev" "libgtk-3-dev")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
pkgdesc="Touchégg is an app that runs in the background and transform the gestures you make on your touchpad or touchscreen into visible actions in your desktop."
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/master | cut -f1 | cut -c1-8
}

build() {
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  cd "${pkgdir}"
  sudo mv usr/local/etc .
}

post_install() {
  sudo systemctl daemon-reload && sudo systemctl enable touchegg --now
}
