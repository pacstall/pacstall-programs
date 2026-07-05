pkgname="neovim-app"
gives="neovim"
replaces=("nvim" "neovim-runtime" "neovim-deb")
arch=("amd64" "arm64")
pkgver="0.12.4"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://neovim.io/'
source_amd64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-x86_64.appimage")
source_arm64=("https://github.com/neovim/neovim/releases/download/v${pkgver}/nvim-linux-arm64.appimage")
sha256sums_amd64=("cdbd8b533b500e272021e1021eafcfe28a77fc4d769465a8f1a48a34002383a7")
sha256sums_arm64=("3b819841c975b9c206eff5676b5827921cc09867059452615e2e02d9c0a665af")
pkgdesc="Vim fork maintained by the community"
repology=("project: neovim")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${srcdir}"
  chmod +x nvim*.appimage
  install -Dm755 nvim*.appimage "${pkgdir}/usr/bin/nvim"
}
