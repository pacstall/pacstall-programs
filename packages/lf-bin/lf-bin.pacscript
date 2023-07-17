name="lf-bin"
pkgname="lf"
repology=("project: ${pkgname}")
gives="${pkgname}"
version="30"
url="https://github.com/gokcehan/${pkgname}/releases/download/r${version}/${pkgname}-linux-amd64.tar.gz"
breaks=("${pkgname}-git")
replace=("${pkgname}")
description="A terminal file manager inspred by ranger written in Go"
hash="8185b7838f84c3f8a9355b76229d24daf155f9001cfd3e3666ead546560d87d7"
arch=('amd64')
maintainer="Romario <romariorobby@yahoo.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
