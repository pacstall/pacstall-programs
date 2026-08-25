pkgname="onefetch-bin"
gives="onefetch"
arch=("amd64")
pkgver="2.27.1"
repology=("project: ${gives}")
source=("https://github.com/o2sh/onefetch/releases/download/${pkgver}/onefetch-linux.tar.gz")
pkgdesc="Git repository summary on your terminal"
sha256sums=("51d6d1d2f7a85bd29dfca2aa3df390616cce322970f7f3cc1840a2295454b0f5")

package() {
  install -Dm755 onefetch -t "${pkgdir}/usr/bin"
}
