pkgname="rtl8821cu-dkms-git"
gives="rtl8821cu-dkms"
repology=("project: ${pkgname}")
pkgdesc="Linux Driver for USB WiFi Adapters that are based on the RTL8811CU, RTL8821CU, RTL8821CUH and RTL8731AU Chipsets"
pkgver="5.12.0.4"
arch=("amd64" "arm64")
url='https://github.com/morrownr/8821cu-20210916'
source=("https://github.com/morrownr/8821cu-20210916.git")
maintainer=("aKqir24 <aKqir24@github.com>")
depends=("dkms")
makedeps=("linux-headers-amd64")
optdepends=("firmware-realtek: realtek non-free-firmware")
_dkmsname="rtl8821cu"

package() {
  cd "${srcdir}/8821cu-20210916"
  mkdir -p "${pkgdir}/usr/src/${_dkmsname}-${pkgver}"
  cp -a ./* "${pkgdir}/usr/src/${_dkmsname}-${pkgver}"

  # Install modprobe .conf file
  mkdir -p "${pkgdir}/etc/modprobe.d"
  cp -a "${pkgdir}/usr/src/${_dkmsname}-${pkgver}/8821cu.conf" "${pkgdir}/etc/modprobe.d/8821cu.conf"

  # Fixing perms
  find "${pkgdir}/usr/src/" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/src/" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/src/" -type f -name "*.sh" -exec chmod 755 {} +
}

pre_upgrade() {
  if dkms status | grep -q "${_dkmsname}/${pkgver}"; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
  fi
}

post_upgrade() {
  dkms install -m "${_dkmsname}" -v "${pkgver}" --force
  if [[ -f /usr/sbin/update-initramfs ]]; then
    update-initramfs -u
  fi
}

pre_remove() {
  if dkms status | grep -q "${_dkmsname}/${pkgver}"; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
    update-initramfs -u
  fi
}

post_install() {
  if [[ -d "/lib/modules/${KVER}/build" ]]; then
    if ! dkms status | grep -q "${_dkmsname}/${pkgver}"; then
      dkms install -m "${_dkmsname}" -v "${pkgver}" --force
      if [[ -f /usr/sbin/update-initramfs ]]; then
        update-initramfs -u
      fi
    fi
  else
    echo -e "${BOLD}ERROR:${NC} Linux headers for ${KVER} not installed."
  fi
}
