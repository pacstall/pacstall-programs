pkgname="rose-pine-cursor"
arch=("all")
pkgver="1.1.0"
license=("GPL-3.0")
pkgdesc="Soho vibes for your mouse cursor"
url='https://rosepinetheme.com/themes/cursor/'
repology=("project: rose-pine-cursor")
maintainer=("tranquil <tranquiltr0@proton.me>")
source=(
  "https://github.com/rose-pine/cursor/releases/download/v${pkgver}/BreezeX-RosePine-Linux.tar.xz"
  "https://github.com/rose-pine/cursor/releases/download/v${pkgver}/BreezeX-RosePineDawn-Linux.tar.xz"
)
sha256sums=(
  "b330d59ce8e0e460209f638a97ce772b78d9e6b56ccf63c8a50e9d941289a1af"
  "85a9dfc31f68a13d536e67200abeb72956300b5388cd3c239b1ce2e198dcadd8"
)

package() {
  install -d "${pkgdir}/usr/share/icons/"
  cp -a --no-preserve=ownership \
    "BreezeX-RosePine-Linux" \
    "${pkgdir}/usr/share/icons"
  cp -a --no-preserve=ownership \
    "BreezeX-RosePineDawn-Linux" \
    "${pkgdir}/usr/share/icons"
}
