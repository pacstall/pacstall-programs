pkgname='aic8800d80-wifi-bt-dkms-git'
conflicts=('aic8800d80' 'aic8800')
pkgver='1.0.0'
pkgdesc='Kernel modules for AIC8800D80 USB dongle WIFI AX900 with BT5.4'
arch=('any')
depends=("dkms")
url="https://github.com/shenmintao/aic8800d80"
license=('GPL-2.0-only')
source=('git+https://github.com/shenmintao/aic8800d80.git#branch=bluetooth')
sha512sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")
_dkmsname='aic8800'

package() {
  cd "${srcdir}/aic8800d80"
  # Copy udev rules
  install -Dm644 "./aic.rules" "${pkgdir}/usr/lib/udev/rules.d/99-aic8800d80.rules"

  # Copy device firmware
  install -d "${pkgdir}/usr/lib/firmware"
  cp -a "./fw/aic8800D80" "${pkgdir}/usr/lib/firmware/"

  # Copy source and dkms config
  install -d "${pkgdir}/usr/src/"
  cp -a "./*" "${pkgdir}/usr/src/${_dkmsname}-${pkgver}/"

  # Fixing perms
  find "${pkgdir}/usr/src/${_dkmsname}/${pkgver}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/src/${_dkmsname}/${pkgver}" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_dkmsname}/${pkgver}" -type f -name "*.sh" -exec chmod 755 {} +
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
