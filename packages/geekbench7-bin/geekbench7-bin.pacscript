pkgname="geekbench7-bin"
gives="geekbench7"
pkgver="7.0.0"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Cross-platform benchmark that measures your system's performance with the press of a button"
url='https://www.geekbench.com'
arch=('amd64')
sha256sums=("961a00ac0ac432ffa6874764e86c59d2e098fff65b5b398bb9381bf7fc46c81b")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_avx2" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_x86_64" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "geekbench.plxr" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "geekbench-workload.plxr" -t "${pkgdir}/opt/${gives}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/${gives}" "${pkgdir}/usr/bin/${gives}"
}
