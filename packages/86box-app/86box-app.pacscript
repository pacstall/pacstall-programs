pkgname="86box-app"
gives="86box"
arch=("amd64" "arm64")
pkgver="6.0"
url='https://86box.net'
pkgdesc="Open source x86 emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source_amd64=("86box.AppImage::https://github.com/86Box/86Box/releases/download/v${pkgver}/86Box-Linux-x86_64-b9001.AppImage")
source_arm64=("86box.AppImage::https://github.com/86Box/86Box/releases/download/v${pkgver}/86Box-NDR-Linux-arm64-b9001.AppImage")
source=("https://raw.githubusercontent.com/86Box/86Box/refs/tags/v${pkgver}/src/unix/assets/net.86box.86Box.desktop")
sha256sums_amd64=("535d3c329f8c32b601103970c86d80aa80298f345452c3524ea2f433624727a4")
sha256sums_arm64=("da1f0c733d7a35059f153398d9978574d38e80019256b336dda9aaca9453a143")
sha256sums=('SKIP')
repology=("project: ${gives}")

package() {
  install -Dm755 "86box.AppImage" "${pkgdir}/usr/bin/86Box"
  install -Dm644 "net.86box.86Box.desktop" -t "${pkgdir}/usr/share/applications"
}
