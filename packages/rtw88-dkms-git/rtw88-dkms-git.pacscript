pkgname="rtw88-dkms-git"
gives="rtw88"
repology=("project: ${gives}")
pkgdesc="Drivers for Realtek 802.11n/802.11ac wireless chips"
pkgver="675.52072d8"
arch=("amd64" "arm64")
url='https://github/lwfinger/rtw88'
depends=(
  "dkms"
)
makedepends=(
  "git"
  "build-essential"
  "linux-headers-${KVER}"
)
optdepends=("usb-modeswitch: A tool that can switch the adapter from CD-ROM mode to Wi-Fi mode")
source=("https://github.com/lwfinger/${gives}.git")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${gives}"
  rm -f convert_firmware.*
	sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
	printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf

}

package() {
  cd "${gives}"
  install -Dm 644 -t "${pkgdir}"/usr/src/${gives}-r${pkgver} *.c *.h Makefile dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${gives}-r${pkgver}/dkms.conf
}
