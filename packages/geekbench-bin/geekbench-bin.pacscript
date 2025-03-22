pkgname="geekbench-bin"
gives="geekbench"
pkgver="6.4.0"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64')
sha256sums=("74c1ae66f3966b6698839c08afe5363482cd7596")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}6" -t "${pkgdir}/opt/${gives}"
  install -Dm755 "${gives}_x86_64" -t "${pkgdir}/opt/${gives}"
  install -Dm755 "${gives}_avx2" -t "${pkgdir}/opt/${gives}"
  install -Dm644 "${gives}.plar" -t "${pkgdir}/opt/${gives}"
  install -Dm644 "${gives}-workload.plar" -t "${pkgdir}/opt/${gives}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/${gives}6" "${pkgdir}/usr/bin/${gives}6"
}
