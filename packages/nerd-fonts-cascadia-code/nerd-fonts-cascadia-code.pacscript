name="nerd-fonts-cascadia-code"
pkgname="nerd-fonts-cascadia-code"
version="3.0.1"
gives="${pkgname}"
breaks=("${pkgname}")
repology=("project: fonts:nerd-fonts")
replace=("${gives}")
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/CascadiaCode.zip"
description="Patched font Cascadia Code from Nerd Fonts library"
hash="73b8fc00ddf76e46f1bf3496958665a7c9793b33485e67bd293da100663f5a34"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

install() {
  sudo install -d "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}/"*.otf "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  ## Won't be necessary and might change in the future ##
  # sudo install -Dm644 "${SRCDIR}"/readme.md "${pkgdir}"/usr/share/doc/"${pkgname}"/readme.md
}
