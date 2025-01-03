pkgname="nerd-fonts-cascadia-code"
arch=("all")
pkgver="3.1.1"
repology=("project: fonts:nerd-fonts")
replaces=("${pkgname}")
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.tar.xz")
pkgdesc="Patched font Cascadia Code from Nerd Fonts library"
sha256sums=("6f5f72a9df47c4d96cc427c89a12c0c538b5873aa46c9e2d3df3306b7429bef4")
maintainer=("heyzsh <haidarzsh@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
