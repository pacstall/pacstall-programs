pkgname="geekbench-bin"
gives="geekbench"
pkgver="5.4.5"
source=("@${pkgname}~${pkgver}::https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
pkgdesc="Geekbench is a cross-platform benchmark that measures your system's performance with the press of a button"
arch=('amd64')
sha256sums=("240f5bbd16fcbb4a86e99b1047da89df2695f678bf324756a3dc51b663e9f762")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}5" -t "${pkgdir}/opt/${gives}"
  install -Dm755 "${gives}_x86_64" -t "${pkgdir}/opt/${gives}"
  install -Dm644 "${gives}.plar" -t "${pkgdir}/opt/${gives}/"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/${gives}5" "${pkgdir}/usr/bin/${gives}5"
}
