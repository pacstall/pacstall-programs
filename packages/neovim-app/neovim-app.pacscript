pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.10.1"
makedepends=("libfuse2")
depends=("libfuse2")
source=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage")
url='https://neovim.io/'
sha256sums=("c4762d54cadfd9fa4497c7969197802c9cf9e0d926c39e561f0bd170e36c8aa0")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${_archive}"
  chmod +x nvim.appimage
  install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
