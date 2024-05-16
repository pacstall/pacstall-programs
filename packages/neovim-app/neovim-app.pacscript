pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.10.0"
makedepends=("libfuse2")
depends=("libfuse2")
source=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage")
url='https://neovim.io/'
sha256sums=("6a021e9465fe3d3375e28c3e94c1c2c4f7d1a5a67e4a78cf52d18d77b1471390")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${_archive}"
  chmod +x nvim.appimage
  install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
