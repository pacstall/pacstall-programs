pkgname="onefetch-bin"
gives="onefetch"
arch=("amd64")
pkgver="2.26.1"
repology=("project: ${gives}")
source=("https://github.com/o2sh/onefetch/releases/download/${pkgver}/onefetch-linux.tar.gz")
pkgdesc="Git repository summary on your terminal"
sha256sums=("fd709bf3a946f6cd0e4b29156379c24f7a07687bac38c2bf7b548d9424b8bc0c")

package() {
  install -Dm755 onefetch -t "${pkgdir}/usr/bin"
}
