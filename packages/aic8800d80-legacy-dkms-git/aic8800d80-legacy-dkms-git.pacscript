pkgname="aic8800d80-legacy-dkms-git"
gives="aic8800d80-legacy-dkms"
conflicts=("aic8800d80" "aic8800")
breaks=("aic8800d80-dkms")
replaces=("aic8800d80-dkms")
pkgver="1.0.0"
pkgdesc="Legacy MCU kernel modules for AIC8800D80 USB WiFi adapters"
arch=('amd64')
depends=("dkms" "eject" "rfkill" "usb-modeswitch")
url='https://github.com/shenmintao/aic8800d80'
license=('GPL-2.0-only')
source=("git+https://github.com/shenmintao/aic8800d80.git#branch=legacy-mcu1")
sha512sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")
_dkmsname="aic8800"

package() {
  cd "${srcdir}/aic8800d80"
  # Copy udev rules
  install -Dm644 "./aic.rules" "${pkgdir}/usr/lib/udev/rules.d/99-aic8800d80.rules"

  # Copy usb_modeswitch configuration
  install -Dm644 "./usb_modeswitch/1111_1111" "${pkgdir}/etc/usb_modeswitch.d/1111:1111"

  # Copy device firmware
  install -d "${pkgdir}/usr/lib/firmware"
  cp -a "./fw/aic8800D80" "${pkgdir}/usr/lib/firmware/"

  # Copy source and dkms config
  install -d "${pkgdir}/usr/src/${_dkmsname}-${pkgver}"
  cp -a ./* "${pkgdir}/usr/src/${_dkmsname}-${pkgver}/"

  # Fixing perms
  find "${pkgdir}/usr/src/" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/src/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/" -type f -name "*.sh" -exec chmod 755 {} +
}

pre_upgrade() {
  if dkms status "${_dkmsname}/${pkgver}" 2> /dev/null | grep -q .; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
  fi
}

post_upgrade() {
  dkms add -m "${_dkmsname}" -v "${pkgver}"
  dkms build -m "${_dkmsname}" -v "${pkgver}"
  dkms install -m "${_dkmsname}" -v "${pkgver}" --force
  if [[ -f /usr/sbin/update-initramfs ]]; then
    update-initramfs -u
  fi
}

pre_remove() {
  if dkms status "${_dkmsname}/${pkgver}" 2> /dev/null | grep -q .; then
    dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
  fi
}

post_remove() {
  if [[ -f /usr/sbin/update-initramfs ]]; then
    update-initramfs -u
  fi
}

post_install() {
  local kernel_version
  kernel_version="$(uname -r)"
  if [[ -d "/lib/modules/${kernel_version}/build" ]]; then
    if dkms status "${_dkmsname}/${pkgver}" 2> /dev/null | grep -q .; then
      dkms remove -m "${_dkmsname}" -v "${pkgver}" --all
    fi
    dkms add -m "${_dkmsname}" -v "${pkgver}"
    dkms build -m "${_dkmsname}" -v "${pkgver}"
    dkms install -m "${_dkmsname}" -v "${pkgver}" --force
    if [[ -f /usr/sbin/update-initramfs ]]; then
      update-initramfs -u
    fi
  else
    echo "ERROR: Linux headers for ${kernel_version} are not installed."
  fi
}
