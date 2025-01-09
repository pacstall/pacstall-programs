pkgname="mint-themes"
arch=("all")
pkgver=2.1.5
repology=("project: mint-themes")
source=("@${pkgname}~${pkgver}::http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_${pkgver}.tar.xz")
pkgdesc="GTK 2, 3, and 4 themes from Linux Mint, for use with Cinammon, MATE, and Xfce."
sha256sums=("685cff6598bdaf4b6813be3080368845f019e09e974e7f589b5f99acb3da2396")
repology=("project: ${gives}")
maintainer=("badlydrawnface <bdface@proton.me>")
makedepends=("python3" "sassc")
optdepends=(
  "mint-y-icons: Complementary icons for Mint-Y themes."
  "mint-x-icons: Complementary icons for Mint-X themes."
)

build() {
  cd "${pkgname}~${pkgver}"
  make clean
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cp -r usr "${pkgdir}/"
}
