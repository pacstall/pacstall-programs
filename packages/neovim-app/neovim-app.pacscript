pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
pkgver="0.9.5"
makedepends=("libfuse2")
depends=("libfuse2")
source=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim.appimage")
homepage='https://neovim.io/'
sha256sums=("0c82e5702af7a11fbb916a11b4a82e98928abf8266c74b2030ea740340437bf9")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${_archive}"
  chmod +x nvim.appimage
  install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
