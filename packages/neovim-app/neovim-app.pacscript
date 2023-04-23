name="neovim-app"
gives="neovim"
replace="nvim neovim-runtime neovim-deb"
version="0.9.0"
build_depends=("libfuse2")
depends=("libfuse2")
url="https://github.com/neovim/neovim/releases/download/v${version}/nvim.appimage"
homepage='https://neovim.io/'
hash="0e1e6d53c6c8055de23bdb33f60bb64af0baf11390669c1b40ecbbf2c7a34547"
description="Vim fork maintained by the community"
repology=("project: neovim")
maintainer="Henryws <hwengerstickel@pm.me>"

install() {
  sudo chmod +x nvim.appimage
  sudo install -Dm755 "nvim.appimage" "${pkgdir}/usr/bin/nvim"
}
