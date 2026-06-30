pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64" "arm64")
pkgver="0.12.3"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://neovim.io/'
source_amd64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-x86_64.appimage")
source_arm64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-arm64.appimage")
sha256sums_amd64=("5709e7f3653c9ccc96bb78e79ae1ad3b1191f34d12075f27c469f702f301a2e8")
sha256sums_arm64=("d39dea9d81767676cbc0804788a78426210d5042efc250ea0ffae4b9fd6b58ee")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim*.appimage
  install -Dm755 nvim*.appimage "${pkgdir}/usr/bin/nvim"
}
