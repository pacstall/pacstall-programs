# Based on jason ryan <jasonwryan@gmail.com> PKGBUILD

pkgname="syncthing-bin"
gives="syncthing"
pkgver="2.1.5"
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url='https://syncthing.net/'
arch=('amd64' 'arm64' 'armhf' 'i386')
repology=("project: ${gives}")
license=('MPL-2.0')
provides=("${gives}")
conflicts=("${gives}")
maintainer=("aKqir24 <aKqir24@github.com>")
source=(
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/stdiscosrv.1"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-bep.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/strelaysrv.1"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-config.5"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-device-ids.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-event-api.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-faq.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-globaldisco.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-localdisco.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-networking.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-relay.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-rest-api.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-security.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-stignore.5"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing-versioning.7"
  "https://raw.githubusercontent.com/${gives}/${gives}/refs/heads/main/man/syncthing.1"
)
source_amd64=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-amd64-v${pkgver}.tar.gz")
source_arm64=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-arm64-v${pkgver}.tar.gz")
source_armhf=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-arm-v${pkgver}.tar.gz")
source_i386=("@${pkgname}-${CARCH}::https://github.com/syncthing/${gives}/releases/download/v${pkgver}/${gives}-linux-386-v${pkgver}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_amd64=('3d222b609f7ab2944e02748cb10488b4160d446b49e0eafc107ef2a525ab3486')
sha256sums_arm64=('3666f3069feeee3651e185f867759206059755101797bdd69ea5317610130855')
sha256sums_armhf=('bb328aa18f70545b91cfa91c88416bec9d11de3500cbc63315d6fcd670ce6076')

sha256sums_i386=('a6bbf3606c5cf934a50122b403c8c563c72d5e19173648a9cf091cd25c2b229d')

package() {
  cd "${pkgname}-${CARCH}"
  install -D -m 755 "${gives}" "${pkgdir}/usr/bin/${gives}"
  install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${gives}/README.md"
  install -D -m 644 "etc/linux-systemd/system/${gives}@.service" "${pkgdir}/usr/lib/systemd/system/${gives}@.service"
  install -D -m 644 "etc/linux-systemd/user/${gives}.service" "${pkgdir}/usr/lib/systemd/user/${gives}.service"
  install -D -m 644 "etc/linux-sysctl/30-${gives}.conf" "${pkgdir}/usr/lib/sysctl.d/30-${gives}.conf"
  install -D -m 644 "etc/firewall-ufw/${gives}" "${pkgdir}/etc/ufw/applications.d/ufw-${gives}"

  # man pages
  cd "${srcdir}"
  for part in {1,5,7}; do
    find . -type f -name "*.${part}" -exec install -Dm644 {} "${pkgdir}/usr/share/man/man${part}/{}" \; -exec gzip -9 "${pkgdir}/usr/share/man/man${part}/{}" \;
  done
}
