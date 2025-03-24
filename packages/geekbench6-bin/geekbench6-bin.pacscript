pkgname="geekbench6-bin"
gives="geekbench6"
pkgver="6.4.0"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64')
sha256sums=("43833053774816178a292331cc205923c5e8168ada378d41b9119532125a50ac")
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
