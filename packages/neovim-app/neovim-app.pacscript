name="neovim-app"
gives="neovim"
replace=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.9.4"
makedepends=("libfuse2")
depends=("libfuse2")
url="https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage"
homepage='https://neovim.io/'
hash="028cfaaf551d64cbb2f39d15363ed78edb01e2673579b48cb694e3604207d656"
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo chmod +x nvim.appimage
  sudo install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
