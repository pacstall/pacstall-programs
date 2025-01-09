pkgname="nerd-fonts-fira-code"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.1.1"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraCode.zip")
pkgdesc="Patched font Fira Code from Nerd Fonts library"
sha256sums=("1ad776cc5c186ff7ba1e2a05eea6701dfa57f7a1763e1db3422979301fb86209")
maintainer=("Nezred <jmnezred@pm.me>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
