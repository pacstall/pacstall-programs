pkgname='aic8800d80-wifi-bt-dkms-git'
_pkgsubn='aic8800d80'
_dkmsname='aic8800'
conflicts=('aic8800d80' 'aic8800')
pkgver='1.0.0'
pkgdesc='Kernel modules for AIC8800D80 USB dongle WIFI AX900 with BT5.4'
arch=('any')
depends=("dkms")
url="https://github.com/shenmintao/aic8800d80"
license=('GPL-2.0-only')
maintainer=("xdavius <xdavius@gmail.com>")

source=('git+https://github.com/shenmintao/aic8800d80.git#branch=bluetooth')
sha512sums=('SKIP')

package() {
  cd "${srcdir}"
  # Copy udev rules
  install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
  install -m 644 "${srcdir}/${_pkgsubn}/aic.rules" "${pkgdir}/usr/lib/udev/rules.d/"

  # Copy device firmware
  install -dm 755 "${pkgdir}/usr/lib/firmware"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgsubn}/fw/aic8800D80" "${pkgdir}/usr/lib/firmware"

  # Copy source and dkms config
  install -dm 755 "${pkgdir}/usr/src/"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgsubn}" "${pkgdir}/usr/src/aic8800-${pkgver}"

  # Remove git stuff
  rm -fr "${pkgdir}/usr/src/aic8800-1.0.0/.git"
}

post_upgrade() {
  if dkms status | grep -q "${_dkmsname}/${pkgver}"; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
  fi
  dkms add -m "${_dkmsname}" -v "${pkgver}"
  dkms build -m "${_dkmsname}" -v "${pkgver}"
  dkms install -m "${_dkmsname}" -v "${pkgver}" --force

  update-initramfs -u
}

post_install() {
  KERNEL_VERSION=$(uname -r)
  if [[ -d "/lib/modules/${KERNEL_VERSION}/build" ]]; then
    if ! dkms status | grep -q "${_dkmsname}/${pkgver}"; then
      dkms add -m "${_dkmsname}" -v "${pkgver}"
      dkms build -m "${_dkmsname}" -v "${pkgver}"
      dkms install -m "${_dkmsname}" -v "${pkgver}" --force
      if [[ -f /usr/sbin/update-initramfs ]]; then
        update-initramfs -u
      fi
    fi
  else
    echo -e "${BOLD}ERROR:${NC} Linux headers for ${KERNEL_VERSION} not installed."
    exit 1
  fi
}

pre_remove() {
  if dkms status | grep -q "${_dkmsname}/${pkgver}"; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
    update-initramfs -u
  fi
}
