# Based on jason ryan <jasonwryan@gmail.com> PKGBUILD

pkgname="syncthing-bin"
gives="syncthing"
pkgver="2.1.3"
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url='https://syncthing.net/'
arch=('amd64' 'arm64' 'armhf' 'i386')
repology=("project: ${gives}")
license=('MPL-2.0')
provides=("${gives}")
conflicts=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source_amd64=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-amd64-v${pkgver}.tar.gz")
source_arm64=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64-v${pkgver}.tar.gz")
source_armhf=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-arm-v${pkgver}.tar.gz")
source_i386=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-386-v${pkgver}.tar.gz")
sha256sums_amd64=('f929eb8e5b72a85543eeeefb2c38f34a68e0c530e70758a2905b78840c76602c')
sha256sums_arm64=('a5c046965b590a8de2f8c8c16a0dbf9201d99600b0cafd604040232b603e4586')
sha256sums_armhf=('f840fa49a353d3c3d9bf64326ed15c028b44d93137572db74a480d625338cbc4')
sha256sums_i386=('a6bbf3606c5cf934a50122b403c8c563c72d5e19173648a9cf091cd25c2b229d')

package() {
  cd "${pkgname}-${CARCH}"
  install -D -m 755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${gives}/README.md"
  install -D -m 644 "etc/linux-systemd/system/${gives}@.service" "${pkgdir}/usr/lib/systemd/system/${gives}@.service"
  install -D -m 644 "etc/linux-systemd/user/${gives}.service" "${pkgdir}/usr/lib/systemd/user/${gives}.service"
  install -D -m 644 "etc/linux-sysctl/30-${gives}.conf" "${pkgdir}/usr/lib/sysctl.d/30-${gives}.conf"
  install -D -m 644 "etc/firewall-ufw/${gives}" "${pkgdir}/etc/ufw/applications.d/ufw-${gives}"
}
