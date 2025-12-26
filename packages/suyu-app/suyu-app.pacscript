pkgname="suyu-app"
gives="suyu"
arch=("amd64")
pkgver="0.0.3"
pkgdesc="Continuation of yuzu, the world's most popular, open-source, Nintendo Switch emulator"
url='https://suyu.dev'
breaks=("${gives}-git")
timestamp="20240410"
commit="0de49070e4"
appimage="${gives}--${timestamp}-${commit}.AppImage"
source=("https://git.suyu.dev/${gives}/${gives}/releases/download/v${pkgver}/${appimage}")
sha256sums=("dbab16853bc1e8ad62fcaddf9b0620e690c8522fbbc6cdddcfcc958f9abb1f47")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract usr/share
  cp -a squashfs-root/usr "${pkgdir}"
  install -Dm755 "${appimage}" "${pkgdir}/opt/${gives}"
  install -dm644 "${pkgdir}/usr/bin"
  ln -s "/opt/${gives}" "${pkgdir}/usr/bin/${gives}"
}
