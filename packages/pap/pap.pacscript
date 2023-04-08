name="pap"
version="0.14.3"
url="https://github.com/talwat/pap/archive/v${version}.tar.gz"
description="Swiss army knife for minecraft servers"
maintainer="Talwat <talwat321@gmail.com>"
build_depends="golang-go"
hash="9902237abed6a103cfecd5798c108c6ebc0a4f9371ba76b6e464b20829517a57"
incompatible=('debian:bullseye')
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install PREFIX="${pkgdir}/usr"
}
