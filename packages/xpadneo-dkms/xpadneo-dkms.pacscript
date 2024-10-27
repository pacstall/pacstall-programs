pkgname="xpadneo-dkms"
gives="xpadneo-dkms"
arch=("any")
pkgver="0.9.6"
pkgdesc="Advanced Linux Driver for Xbox One S/X Wireless Gamepad"
url='https://github.com/atar-axis/xpadneo'
depends=('dkms' 'bluetooth')
source=("https://github.com/atar-axis/xpadneo/archive/v${pkgver}.tar.gz"
  "drop-etc-files.patch::https://aur.archlinux.org/cgit/aur.git/plain/drop-etc-files.patch?h=xpadneo-dkms"
  "rename-marker.patch::https://aur.archlinux.org/cgit/aur.git/plain/rename-marker.patch?h=xpadneo-dkms")
maintainer=("xdavius <xdavius@github.com>")

_gives="xpadneo"
_dkmsname="hid-${_gives}"
_pkgver="v${pkgver}"

prepare() {
  cd "${_gives}-${pkgver}/${_dkmsname}"

  # Upstream uses dkms.post_install to create modprobe and udev files in
  # /etc. In Arch, it makes more sense to create these files in /usr/lib
  # and let pacman take care of them.
  patch -p1 -i "${srcdir}/drop-etc-files.patch"

  # Set the current version in DKMS config file.
  patch -p1 -i "${srcdir}/rename-marker.patch"
  sed "s/@PACKAGE_VERSION@/${_pkgver}/" dkms.conf.in > dkms.conf
}

check() {
  # Warning if missing linux-headers for current `uname -r` kernel
  if [[ ! -f "/usr/lib/modules/$(uname -r)/build/Makefile" ]]; then
    _BOLDRED='\033[1;31m'
    _RED='\033[0;31m'
    _RESET='\033[0m'
    echo -e "${_BOLDRED}WARNING:${_RED} You may be missing headers for your current kernel, DKMS packages requires them."
    echo -e "Please refer to Ubuntu/Debian Manual for details.${_RESET}"
  fi
}

package() {
  cd "${_gives}-${pkgver}/${_dkmsname}"
  # Module source
  install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-${_pkgver}/src" src/*

  # DKMS files
  install -Dm0644 -t "${pkgdir}/usr/src/${_dkmsname}-${_pkgver}" Makefile dkms.conf dkms.post_install dkms.post_remove
  install -Dm0755 -t "${pkgdir}/usr/src/${_dkmsname}-${_pkgver}" dkms.post_install dkms.post_remove

  # modprobe aliases
  install -Dm0644 -t "${pkgdir}/usr/lib/modprobe.d" etc-modprobe.d/*

  # udev rules
  install -Dm0644 -t "${pkgdir}/usr/lib/udev/rules.d" etc-udev-rules.d/*

}

post_upgrade() {
  update-initramfs -u -k all
}

post_install() {

  DKMS_NAME="${_dkmsname}"
  DKMS_VERSION="${_pkgver}"

  dkms add -m "${DKMS_NAME}" -v "${DKMS_VERSION}"
  dkms build -m "${DKMS_NAME}" -v "${DKMS_VERSION}"
  dkms install -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --force || true

  update-initramfs -u -k all
}

pre_remove() {

  DKMS_NAME="${_dkmsname}"
  DKMS_VERSION="${_pkgver}"

  dkms remove -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --all || true

  update-initramfs -u -k all
}
