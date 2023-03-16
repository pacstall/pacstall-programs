name="pap"
version="0.13.4"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends="golang-go"
hash="328cf362fd9570919e65c42f47232c1b981bb94c9a0f3cb1d128b906712b0e2d"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install PREFIX="${pkgdir}/usr"
}
