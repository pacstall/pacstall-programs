name="pap"
version="0.15.0"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends=("golang-go")
hash="743fd7d6d8f6e5fcd198ee75fcc54fd77ce272c77009cfa2c28c0eb6aec5121c"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

package() {
  sudo make install PREFIX="${pkgdir}/usr"
}
