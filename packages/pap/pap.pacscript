name="pap"
version="0.14.1"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends="golang-go"
hash="b1bd3164730dcd497def78273ef703ded09eba72ce9f6a47dcc4b57fcdad2174"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install PREFIX="${pkgdir}/usr"
}
