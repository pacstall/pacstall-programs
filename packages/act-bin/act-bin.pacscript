pkgname="act-bin"
gives="act"
pkgver="0.2.99"
pkgdesc="Run your GitHub Actions locally"
arch=('amd64' 'arm64')
url='https://github.com/nektos/act'
license=('MIT')
source_amd64=("${url}/releases/download/v${pkgver}/act_Linux_x86_64.tar.gz")
source_arm64=("${url}/releases/download/v${pkgver}/act_Linux_arm64.tar.gz")
sha256sums_amd64=("244abf6b011257ae959be907d618a8243863991020190c9107e151b545e32cdd")
sha256sums_arm64=("e7544abd0d74a06fd63a158a45c0f935c54a3f8759bf4c615034b1eb66d3a950")
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  install -Dm755 "act" -t "${pkgdir}/usr/bin/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}/"
}
