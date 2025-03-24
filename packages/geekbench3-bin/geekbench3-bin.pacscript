pkgname="geekbench3-bin"
gives="geekbench3"
pkgver="3.4.4"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Legacy version. Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64' 'i386')
sha256sums=("5d2bcc51378f5459551461111288861d5c483d14fbe7dfa805d15c3099690e18")

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
