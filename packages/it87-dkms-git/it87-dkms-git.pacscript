pkgname="it87-dkms-git"
gives="it87"
pkgver="152"
_pkgoldver="152"
pkgrel="3"
pkgdesc="Linux Driver for ITE LPC chips"
arch=('x86_64')
url='https://github.com/frankcrawford/it87'
depends=("dkms")
makedepends=('git')
provides=('it87')
source=("${gives}::git+https://github.com/frankcrawford/it87.git"
  "dkms.conf"
  "it87.conf")
sha256sums=('SKIP'
  'f325b751c8a81416a75c2c1e7a7bc9ca46ae0fa3b44d4ccc09593274be1b2dc7'
  'acdc488d1505e891ed6259b29428d4b27d26d18e3ea170f017b930390d6420e7')
maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "${srcdir}/${gives}"

  install -d "${pkgdir}/usr/src/${gives}-${pkgver}/"
  cp -r "${srcdir}/${gives}"/* "${pkgdir}/usr/src/${gives}-${pkgver}/"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${gives}-${pkgver}/dkms.conf"

  sed -e "s/@_PKGBASE@/${gives}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}/usr/src/${gives}-${pkgver}/dkms.conf"

  install -Dm644 "${srcdir}/it87.conf" "${pkgdir}/usr/lib/depmod.d/it87.conf"
}

post_upgrade() {
  if dkms status | grep -q "${gives}/${_oldpkgver}"; then
    dkms remove -m "${gives}" -v "${_pkgoldver}" --all
  fi
  dkms add -m "${gives}" -v "${pkgver}"
  dkms build -m "${gives}" -v "${pkgver}"
  dkms install -m "${gives}" -v "${pkgver}" --force

  update-initramfs -u
}

post_install() {
  KERNEL_VERSION=$(uname -r)
  RED='\033[0;31m'
  NC='\033[0m'
  if [[ -d "/lib/modules/${KERNEL_VERSION}/build" ]]; then
    if ! dkms status | grep -q "${gives}/${pkgver}"; then
      dkms add -m "${gives}" -v "${pkgver}"
      dkms build -m "${gives}" -v "${pkgver}"
      dkms install -m "${gives}" -v "${pkgver}" --force
      if [[ -f /usr/sbin/update-initramfs ]]; then
        update-initramfs -u
      fi
    fi
  else
    echo -e "${RED}Error : Linux Headers for ${KERNEL_VERSION} not installed.${NC}"
    exit 0
  fi
}

pre_remove() {
  if dkms status | grep -q "${gives}/${pkgver}"; then
    dkms remove -m "${gives}" -v "${pkgver}" --all
    update-initramfs -u
  fi
}
