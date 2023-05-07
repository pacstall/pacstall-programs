name="slop-git"
pkgname="slop"
description="Queries for a selection from the user and prints the region to stdout"
url="https://github.com/naelstrof/slop.git"
build_depends=("cmake" "libglm-dev" "libxrender-dev" "libxfixes-dev" "libxcomposite-dev" "libxrandr-dev")
depends=("libglew-dev" "libxext-dev")
breaks=("${pkgname}-bin" "${pkgname}")
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ./
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
