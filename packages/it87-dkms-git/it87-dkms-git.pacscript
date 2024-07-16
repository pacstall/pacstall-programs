pkgname="it87-dkms-git"
gives="it87"
pkgver="152"
pkgdesc="Linux Driver for ITE LPC chips"
arch=('x86_64' 'i686')
url='https://github.com/frankcrawford/it87'
depends=('dkms')
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
  update-initramfs -u -k all
}

post_install() {
  DKMS_NAME="${gives}"
  DKMS_VERSION="${pkgver}"

  dkms add -m "${DKMS_NAME}" -v "${DKMS_VERSION}"
  dkms build -m "${DKMS_NAME}" -v "${DKMS_VERSION}"
  dkms install -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --force || true

  update-initramfs -u -k all
}

pre_remove() {
  DKMS_NAME="${gives}"
  DKMS_VERSION="${pkgver}"

  dkms remove -m "${DKMS_NAME}" -v "${DKMS_VERSION}" --all || true

  update-initramfs -u -k all
}
