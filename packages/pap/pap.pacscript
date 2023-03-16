name="pap"
version="0.13.3"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends="golang-go"
hash="14923a1f86f809b0189719d7900173c46d257922d177567d17f14c149eac2430"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install PREFIX="${pkgdir}/usr"
}
