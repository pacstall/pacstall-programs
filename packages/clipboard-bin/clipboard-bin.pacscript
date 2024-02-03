#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="clipboard-bin"
pkgname="clipboard"
gives="clipboard"
pkgver="0.9.0.1"
pkgdesc="Cut, copy, and paste anything in your terminal"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64")
repology=("project: clipboard")
url="https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${pkgname}-linux-${CARCH}.zip"
case "${CARCH}" in
  amd64)
    hash="5b90cd7299c1c0d679cfe8c1bd4e89e7fd70ebede2890d90a6f1da98a90e922b"
    ;;
  arm64)
    hash="07493b5e9954585160fc54314e23e4897652f06594f6ec7ceba66b32d7f72b82"
    ;;
  armhf)
    hash="7654d6f5176e554ed86d84f16924b2ec3d7a7e0000f24a43ee6772397b986dea"
    ;;
  ppc64el)
    hash="a7c2c689a777d57fe6638a469c408753d1b4d5d61c8fecd141a4781f54a24e7a"
    ;;
  riscv64)
    hash="e92f2c4eeeefd093d25f91f186c1c3ac572ea254369fe7028928246d431407c8"
    ;;
  *) ;;
esac

package() {
  if [[ ${CARCH} == "amd64" ]]; then
    sudo install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  fi
  sudo install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  sudo install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}

# vim:set ft=sh ts=2 sw=2 et:
