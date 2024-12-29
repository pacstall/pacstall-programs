pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64")
pkgver="0.10.3"
makedepends=("libfuse2")
depends=("libfuse2")
source=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage")
url='https://neovim.io/'
sha256sums=("ce5f6462d4fa7150cc90c593955f66f7707ab5edc1d18f87413ea482e096c24e")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim.appimage
  install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
