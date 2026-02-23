pkgname="geekbench6-bin"
gives="geekbench6"
pkgver="6.6.0"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64')
sha256sums=("c94510f3658cd31d55bbc5feb21aef19f5a34ff4036f789643c0dc212104b0e7")
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_avx2" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_x86_64" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "geekbench.plar" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "geekbench-workload.plar" "${pkgdir}/opt/${gives}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/${gives}" "${pkgdir}/usr/bin/${gives}"
}
