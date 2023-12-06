name="lf-bin"
gives="lf"
repology=("project: ${gives}")
pkgver="30"
url="https://github.com/gokcehan/${gives}/releases/download/r${pkgver}/${gives}-linux-amd64.tar.gz"
breaks=("${gives}-git")
replace=("${gives}")
pkgdesc="A terminal file manager inspred by ranger written in Go"
hash="8185b7838f84c3f8a9355b76229d24daf155f9001cfd3e3666ead546560d87d7"
arch=('amd64')
maintainer="Romario <romariorobby@yahoo.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
