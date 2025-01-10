pkgname="neofetch"
arch=("all")
pkgver="7.1.0"
source=("@${pkgname}~${pkgver}::https://github.com/dylanaraps/neofetch/archive/${pkgver}.zip")
optdepends=("w3m-img: image preview"
  "libsixel-dev: image preview"
  "catimg: image preview"
  "jp2a: image preview"
  "caca-utils: image preview"
  "libcaca-dev: image preview")
pkgdesc="Command-line system information tool"
sha256sums=("e610da6561f17c8161337d0c4115da310be576e8699fa2add64e14eeb3f3dcf1")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
