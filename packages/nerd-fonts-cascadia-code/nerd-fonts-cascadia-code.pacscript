name="nerd-fonts-cascadia-code"
pkgname="nerd-fonts-cascadia-code"
version="3.0.0"
gives="${pkgname}"
breaks=("${pkgname}")
repology=("project: fonts:nerd-fonts")
replace=("${gives}")
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/CascadiaCode.zip"
description="Patched font Cascadia Code from Nerd Fonts library"
hash="18692fc6f7829cb9fc71c1d3e409e2595539d310464d76523f27732107753dfc"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

install() {
  sudo install -d "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}/"*.otf "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  ## Won't be necessary and might change in the future ##
  # sudo install -Dm644 "${SRCDIR}"/readme.md "${pkgdir}"/usr/share/doc/"${pkgname}"/readme.md
}
