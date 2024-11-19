pkgname="setconf"
arch=("all")
pkgver="0.7.7"
pkgdesc='Utility for easily changing settings in configuration files'
url='https://setconf.roboticoverlords.org/'
depends=("python3" "python-is-python3")
source=("https://setconf.roboticoverlords.org/${pkgname}-${pkgver}.tar.xz")
sha256sums=("19315574540b3181fec31a4059b9e058381e0192317f153d181e7e7e2aa84d86")
maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
