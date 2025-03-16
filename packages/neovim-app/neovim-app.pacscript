pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64" "arm64")
pkgver="0.10.4"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://neovim.io/'
source_amd64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-x86_64.appimage")
source_arm64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-arm64.appimage")
sha256sums_amd64=("d1b1488ef6a970dc3a2826b788d31d81b2f308ad42ef70ed62d35d0bf6189336")
sha256sums_arm64=("cc02d640809f6cfb27ee5fca78cc612ccda0dc4fbb648430d49de623660d0216")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim*.appimage
  install -Dm755 nvim*.appimage "${pkgdir}/usr/bin/nvim"
}
