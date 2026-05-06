pkgname="rtl8821cu-dkms-git"
gives="rtl8821cu-dkms"
repology=("project: ${pkgname}")
pkgdesc="Linux Driver for USB WiFi Adapters that are based on the RTL8811CU, RTL8821CU, RTL8821CUH and RTL8731AU Chipsets"
pkgver="1.0.0"
arch=("amd64" "arm64")
url='https://github.com/morrownr/8821cu-20210916'
maintainer=("aKqir24 <aKqir24@github.com>")
depends=("dkms")
_dkmsname="rtl8821cu"
_dkmsver="5.12.0.4"

package() {
  cd "${srcdir}/8821cu-20210916"
  mkdir -p "${pkgdir}/usr/src/rtl8821cu-5.12.0.4"
  cp -r * "${pkgdir}/usr/src/rtl8821cu-5.12.0.4"
  chown -R root:root "${pkgdir}/usr/src/rtl8821cu-5.12.0.4"
}

post_upgrade() {
  if dkms status | grep -q "${_dkmsname}/$_dkmsver}"; then
    dkms remove -m "${_dkmsname}" -v "${_dkmsver}" --all
  fi
  dkms install -m "${_dkmsname}" -v "${_dkmsver}" --force

  update-initramfs -u
}

post_install() {
  KERNEL_VERSION=$(uname -r)
  if [[ -d "/lib/modules/${KERNEL_VERSION}/build" ]]; then
    if ! dkms status | grep -q "${_dkmsname}/${_dkmsver}"; then
      dkms install -m "${_dkmsname}" -v "${_dkmsver}" --force
      if [[ -f /usr/sbin/update-initramfs ]]; then
        update-initramfs -u
      fi
    fi
  else
    echo -e "${BOLD}ERROR:${NC} Linux headers for ${KERNEL_VERSION} not installed."
  fi
}

pre_remove() {
  if dkms status | grep -q "${_dkmsname}/${_dkmsver}"; then
    dkms remove -m "${_dkmsname}" -v "${_dkmsver}" --all
    update-initramfs -u
  fi
}
