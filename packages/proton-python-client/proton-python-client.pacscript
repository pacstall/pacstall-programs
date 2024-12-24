pkgname="proton-python-client"
breaks="${pkgname}-git ${pkgname}-bin"
replaces=("${pkgname}")
repology=("project: ${pkgname}")
arch=("all")
pkgver="0.7.1"
source=("@${pkgname}~${pkgver}::https://github.com/ProtonMail/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("python3-requests" "python3-setuptools" "python3-bcrypt" "python3-gnupg" "python3-openssl")
pkgdesc="Python Proton client module"
sha256sums=("88d2546a922d9053988b5e1863bf6cf965e97b4c643cd879f16bb3f0b5f02b5e")

package() {
  cd "${pkgname}~${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
