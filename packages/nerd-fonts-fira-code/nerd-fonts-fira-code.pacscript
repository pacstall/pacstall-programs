name="nerd-fonts-fira-code"
replace=("${name}")
repology=("project: fonts:nerd-fonts")
pkgver="3.1.1"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraCode.zip"
pkgdesc="Patched font Fira Code from Nerd Fonts library"
hash="1ad776cc5c186ff7ba1e2a05eea6701dfa57f7a1763e1db3422979301fb86209"
maintainer="Nezred <jmnezred@pm.me>"

package() {
  sudo install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}"
}
