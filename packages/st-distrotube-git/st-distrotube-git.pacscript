name="st-distrotube-git"
maintainer="edward-riley <edward@edwardriley.co.uk>"
url="https://gitlab.com/dwt1/st-distrotube.git"
build_depends=("make" "libharfbuzz-bin" "libxft-dev" "libpango1.0-dev")
depends=("fontconfig")
gives="st"
description="Distrotube's st build"
breaks="st"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
