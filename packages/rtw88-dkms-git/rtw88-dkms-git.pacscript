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
  "perl"
  "build-essential"
  "linux-headers-${KVER}"
)
optdepends=("usb-modeswitch: A tool that can switch the adapter from CD-ROM mode to Wi-Fi mode")
source=("https://github.com/lwfinger/${gives}.git")
maintainer=("aKqir24 <aKqir24@github.com>")

prepare() {
  cd "${gives}"
  rm -f convert_firmware.*
  sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
  printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf
  perl -pi -e 's/\r$//' dkms.conf
  sudo perl -pi -e 's/\r$//' /usr/src/rtw88-${pkgver}/dkms.conf 2> /dev/null || true
}

package() {
  cd "${gives}"
  install -Dm644 -t "${pkgdir}/usr/src/${gives}-${pkgver}" -- *.c *.h Makefile dkms.conf
  install -Dm644 rtw88.conf "${pkgdir}/etc/modprobe.d/rtw88.conf"
  sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${gives}-${pkgver}/dkms.conf"
}

post_install() {
  fancy_message info "Please do this after install:\n sudo dkms add -m rtw88 -v ${pkgver}\n sudo dkms build -m rtw88 -v ${pkgver}\n sudo dkms install -m rtw88 -v ${pkgver}"
}

post_remove() {
  rm -rf "/usr/src/${gives}-${pkgver}"
}
