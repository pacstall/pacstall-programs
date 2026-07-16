pkgname="gittype-bin"
gives="gittype"
repology=("project: ${pkgname}")
pkgver='0.10.0'
maintainer=("aKqir24 <aKqir24@github.com>")
pkgdesc='CLI code-typing game that turns your source code into typing challenges'
source_amd64=("https://github.com/unhappychoice/gittype/releases/download/v${pkgver}/gittype-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/unhappychoice/gittype/releases/download/v${pkgver}/gittype-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_amd64=('5e227fa47ba38602ac159bfc3d52cd6978924bf69523f1063ee7577e969d391d')
sha256sums_arm64=('d260b03e28cbccfba8aa5055f349e1ce75565db62057d426357437f7159f0356')
arch=('amd64' 'arm64')

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
