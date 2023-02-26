name="nerd-fonts-cascadia-code"
pkgname="nerd-fonts-cascadia-code"
version="2.3.3"
gives="${pkgname}"
breaks="${pkgname}"
repology=("project: fonts:nerd-fonts")
replace="${gives}"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/CascadiaCode.zip"
description="Patched font Cascadia Code from Nerd Fonts library"
hash="644591a9ae4588128e651d7d464daaabc30ff2bede447a921c0374f9d472748f"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

install() {
  sudo install -d "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}/"*.otf "${pkgdir}"/usr/share/fonts/OTF
  sudo install -Dm644 "${SRCDIR}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  ## Won't be necessary and might change in the future ##
  # sudo install -Dm644 "${SRCDIR}"/readme.md "${pkgdir}"/usr/share/doc/"${pkgname}"/readme.md
}
