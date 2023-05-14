name="touchegg-git"
pkgname="touchegg"
url="https://github.com/JoseExposito/touchegg.git"
build_depends=("git" "build-essential" "gdb" "cmake" "debhelper" "libudev-dev" "libinput-dev" "libpugixml-dev" "libcairo2-dev" "libx11-dev" "libxtst-dev" "libxrandr-dev" "libxi-dev" "libglib2.0-dev" "libgtk-3-dev")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app")
description="Touchégg is an app that runs in the background and transform the gestures you make on your touchpad or touchscreen into visible actions in your desktop."
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  cd "${pkgdir}"
  sudo mv usr/local/etc .
}

postinst() {
  sudo systemctl daemon-reload && sudo systemctl enable touchegg --now
}
