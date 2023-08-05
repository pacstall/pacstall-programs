name="neovim-app"
gives="neovim"
replace=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.9.1"
makedepends=("libfuse2")
depends=("libfuse2")
url="https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage"
homepage='https://neovim.io/'
hash="262892176e21da0902c4f0b1e027d54d21b4bcae6b0397afccd8a81b476c3055"
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer="Elsie19 <hwengerstickel@pm.me>"

package() {
  sudo chmod +x nvim.appimage
  sudo install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
