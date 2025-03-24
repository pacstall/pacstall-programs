pkgname="geekbench2-bin"
gives="geekbench2"
pkgver="2.4.3"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Legacy version. Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64' 'i386')
sha256sums=("d9384c4cc74406da598256c7a48506c2f3f44e7b3d54f5d317bc47a7e17807ed")
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  # This old version has a folder inside the tarball
  cd "Geekbench-${pkgver}-Linux"
  # Also, the binary is named "geekbench" instead of "geekbench3"
  install -Dm755 "geekbench" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_x86_64" -t "${pkgdir}/opt/${gives}/"
  install -Dm755 "geekbench_x86_32" -t "${pkgdir}/opt/${gives}/"
  install -Dm644 "geekbench.plar" -t "${pkgdir}/opt/${gives}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/geekbench" "${pkgdir}/usr/bin/${gives}"
}
