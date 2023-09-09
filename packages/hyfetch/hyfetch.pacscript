name="hyfetch"
pkgver="1.4.10"
url="https://github.com/hykilpikonna/hyfetch/archive/refs/tags/${pkgver}.zip"
optdepends=("w3m-img: image preview"
  "libsixel-dev: image preview"
  "pipx: install helper"
  "catimg: image preview"
  "jp2a: image preview"
  "caca-utils: image preview"
  "fastfetch-git: alt backend"
  "libcaca-dev: image preview")
pkgdesc="neofetch with pride flags <3"
makedepends=("python3-setuptools")
hash="5850e5b363b2268ce270b8dd3b33ed00e3d00948c40cebcf8ab6c7cfdfcc41ec"
maintainer="Herisson <spaceguybox@outlook.com>"

package() {
  sudo ./setup.py install --prefix ${pkgdir}
}
