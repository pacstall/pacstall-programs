pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64" "arm64")
pkgver="0.11.4"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://neovim.io/'
source_amd64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-x86_64.appimage")
source_arm64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-arm64.appimage")
sha256sums_amd64=("79e7e160f9505819a5e12f3d9366be94213f5309fb912ef4ef3af52df3982977")
sha256sums_arm64=("ab54ea9decf32d63a868810dcbc6d0cf8d1592435e383bd84e3d4f4d341ad3ab")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim*.appimage
  install -Dm755 nvim*.appimage "${pkgdir}/usr/bin/nvim"
}
