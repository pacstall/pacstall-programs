name="nerd-fonts-cascadia-code"
gives="nerd-fonts-cascadia-code"
pkgver="3.0.2"
breaks=("${gives}")
repology=("project: fonts:nerd-fonts")
replace=("${gives}")
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/CascadiaCode.zip"
pkgdesc="Patched font Cascadia Code from Nerd Fonts library"
hash="e68cf12cc3c14a18b9ddce0e77f66a78e3ebec4a5224423674fdd9303c5c9272"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}/"*.otf "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}"/LICENSE "${pkgdir}"/usr/share/licenses/"${gives}"/LICENSE
  ## Won't be necessary and might change in the future ##
  # sudo install -Dm644 "${SRCDIR}"/readme.md "${pkgdir}"/usr/share/doc/"${gives}"/readme.md
}
