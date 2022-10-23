name="nerd-fonts-cascadia-code"
pkgname="nerd-fonts-cascadia-code"
version="2.2.2"
gives="${pkgname}"
breaks="${pkgname}"
repology=("project: fonts:nerd-fonts")
replace="${gives}"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/CascadiaCode.zip"
description="Patched font Cascadia Code from Nerd Fonts library"
hash="b4f4f20ab6bbf55dd9ae7dd1fadd4ef2c608f38922c401afcce373b36a9b0407"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

install() {
    sudo install -d "${pkgdir}"/usr/share/fonts/OTF
    sudo install -Dm644 "${SRCDIR}/"*.otf "${pkgdir}"/usr/share/fonts/OTF
    sudo install -Dm644 "${SRCDIR}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    ## Won't be necessary and might change in the future ##
    # sudo install -Dm644 "${SRCDIR}"/readme.md "${pkgdir}"/usr/share/doc/"${pkgname}"/readme.md
}
