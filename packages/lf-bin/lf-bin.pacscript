name="lf-bin"
pkgname="lf"
repology=("project: ${pkgname}")
gives="${pkgname}"
version="28"
url="https://github.com/gokcehan/${pkgname}/releases/download/r${version}/${pkgname}-linux-amd64.tar.gz"
breaks=("${pkgname}-git")
replace=("${pkgname}")
description="A terminal file manager inspred by ranger written in Go"
hash="4ef583838437fe1f4a3dcec78c96679c6b79e2e5405432efe9baa7ee341746c5"
arch=('amd64')
maintainer="Romario <romariorobby@yahoo.com>"

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
