name="neovim-app"
gives="neovim"
replace=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.9.2"
makedepends=("libfuse2")
depends=("libfuse2")
url="https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage"
homepage='https://neovim.io/'
hash="61950131e18157ab9c7f14131a3dda0aa81f8e4fb47994bf6d8b418d9be6e3c0"
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo chmod +x nvim.appimage
  sudo install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
