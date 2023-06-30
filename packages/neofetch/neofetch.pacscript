name="neofetch"
version="7.1.0"
url="https://github.com/dylanaraps/neofetch/archive/${version}.zip"
optdepends=("w3m-img: image preview"
  "libsixel-dev: image preview"
  "catimg: image preview"
  "jp2a: image preview"
  "caca-utils: image preview"
  "libcaca-dev: image preview")
description="Command-line system information tool"
hash="e610da6561f17c8161337d0c4115da310be576e8699fa2add64e14eeb3f3dcf1"
maintainer="Elsie19 <hwengerstickel@pm.me>"

install() {
  sudo make install DESTDIR="${pkgdir}"
}
