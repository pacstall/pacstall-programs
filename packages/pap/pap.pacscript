name="pap"
version="0.14.4"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends="golang-go"
hash="16fa05c5055656c6696fa74e8009929b9d0abb1687ba135d4102960a183821b4"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install PREFIX="${pkgdir}/usr"
}
