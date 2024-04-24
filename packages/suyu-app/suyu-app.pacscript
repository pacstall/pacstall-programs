name="suyu-app"
gives="suyu"
pkgver="0.0.3"
pkgdesc="Continuation of yuzu, the world's most popular, open-source, Nintendo Switch emulator"
homepage='https://suyu.dev'
breaks=("${gives}-git")
timestamp="20240410"
commit="0de49070e4"
appimage="${gives}--${timestamp}-${commit}.AppImage"
url="https://git.suyu.dev/${gives}/${gives}/releases/download/v${pkgver}/${appimage}"
hash="dbab16853bc1e8ad62fcaddf9b0620e690c8522fbbc6cdddcfcc958f9abb1f47"
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${gives}")

package() {
  sudo chmod +x "${appimage}"
  ./"${appimage}" --appimage-extract usr/share
  sudo cp -a squashfs-root/usr "${pkgdir}"
  sudo install -Dm755 "${appimage}" "${pkgdir}/opt/${gives}"
  sudo install -dm644 "${pkgdir}/usr/bin"
  sudo ln -s "/opt/${gives}" "${pkgdir}/usr/bin/${gives}"
}
