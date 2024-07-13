gives=it87
pkgname=it87-dkms-git
pkgver=152
pkgdesc="Linux Driver for ITE LPC chips"
arch=('x86_64' 'i686')
url='https://github.com/frankcrawford/it87'
depends=('dkms' 'linux-headers-amd64')
makedepends=('git')
provides=('it87')

source=("$gives::git+https://github.com/frankcrawford/it87.git"
  "dkms.conf"
  "it87.conf")

sha256sums=('SKIP'
  'f325b751c8a81416a75c2c1e7a7bc9ca46ae0fa3b44d4ccc09593274be1b2dc7'
  'acdc488d1505e891ed6259b29428d4b27d26d18e3ea170f017b930390d6420e7')

prepare() {
  cd "${srcdir}/${gives}"
}

package() {
  cd "${srcdir}/${gives}"

  install -d "${pkgdir}"/usr/src/${gives}-${pkgver}/
  cp -r ${srcdir}/${gives}/* "${pkgdir}"/usr/src/${gives}-${pkgver}/

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${gives}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${gives}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${gives}-${pkgver}/dkms.conf

  install -Dm644 ${srcdir}/it87.conf "${pkgdir}"/usr/lib/depmod.d/it87.conf
}

post_upgrade() {
  update-initramfs -u -k all
}

post_install() {

  set -e

  DKMS_NAME="it87"
  DKMS_VERSION="152"

  dkms add -m ${DKMS_NAME} -v ${DKMS_VERSION}
  dkms build -m ${DKMS_NAME} -v ${DKMS_VERSION} && dkms install -m ${DKMS_NAME} -v ${DKMS_VERSION} --force || true

  update-initramfs -u -k all
}

pre_remove() {

  set -e

  SRC_DKMS_NAME="it87"
  SRC_INSTALLED=$(ls /usr/src/ | grep $SRC_DKMS_NAME)
  DKMS_NAME=$(echo $SRC_INSTALLED | cut -d "-" -f1)
  DKMS_VERSION=$(echo $SRC_INSTALLED | cut -d "-" -f2)

  dkms remove -m $DKMS_NAME -v $DKMS_VERSION --all || true

  update-initramfs -u -k all
}
