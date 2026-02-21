pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64" "arm64")
pkgver="0.11.6"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://neovim.io/'
source_amd64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-x86_64.appimage")
source_arm64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-arm64.appimage")
sha256sums_amd64=("77dd16d86e6549a0bbbbfbc18636d434ffe5b0ac8b9854a7669e35cc4b93dda0")
sha256sums_arm64=("ed34c4d8eb79eb2d111987f57cce9ba87c31a97524d602752ce1b0cd35e6a554")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim*.appimage
  install -Dm755 nvim*.appimage "${pkgdir}/usr/bin/nvim"
}
