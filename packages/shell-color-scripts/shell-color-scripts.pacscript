pkgname="shell-color-scripts"
arch=("all")
pkgver="3.0"
source=("@${pkgname}~${pkgver}::https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz")
pkgdesc="A collection of terminal color scripts."
sha256sums=("31d94efd426d3d62459e2056cb4ea5ba051f77f46557a3cc0ad7b2ffdd48bf84")
maintainer=("Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -D colorscript.sh "${pkgdir}/usr/bin/colorscript"
  install -D colorscripts/* -t "${pkgdir}/opt/shell-color-scripts/colorscripts"
}
