pkgname="tela-circle-icon-theme"
arch=('any')
pkgver="2025-02-10"
pkgdesc="A flat, colorful icon theme"
repology=("project: tela-circle-icon-theme" "repo: aur")
source=("@${pkgname}~${pkgver}::https://github.com/vinceliuice/Tela-circle-icon-theme/archive/refs/tags/${pkgver}.zip")
sha256sums=("96728dd1b173e60602d3ffc7679ceffbcde1dbb7503c46b4d09c3ba5e65ee8bc")
maintainer=("Herisson <spaceguybox@outlook.com>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git")
depends=("gtk-update-icon-cache")
build() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
}

package() {
  cd "${pkgname}~${pkgver}"
  for i in elementary links src; do
    cp -r "${i}" "${pkgdir}/usr/share/${pkgname}"
  done
  install -Dm755 install.sh -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/${pkgname}"
}

post_install() {
  ./usr/share/"${pkgname}"/install.sh -c -a
}
