pkgname="rtl8821cu-dkms-git"
gives="8821cu-20210916"
repology=("project: ${pkgname}")
pkgdesc="Linux Driver for USB WiFi Adapters that are based on the RTL8811CU, RTL8821CU, RTL8821CUH and RTL8731AU Chipsets"
pkgver="5.12.0.4"
arch=("amd64" "arm64")
url='https://github.com/morrownr/8821cu-20210916'
depends=(
  "dkms"
  "curl"
  "kmod"
  "bc"
  "iproute2"
)
makedepends=(
  "bash"
  "nano"
  "bc"
  "build-essential"
  "linux-headers-${CARCH}"
)
pacdeps=("firmware-realtek-deb")
optdepends=("usb-modeswitch: A tool that can switch the adapter from CD-ROM mode to Wi-Fi mode")
source=("https://github.com/morrownr/${gives}.git")
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  cd "${gives}"
  bash install-driver.sh
}

post_remove() {
  modprobe -r rtl8821cu
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/morrownr/8821cu-20210916/refs/heads/main/remove-driver.sh)"
}

post_install() {
  modprobe rtl8821cu
}
