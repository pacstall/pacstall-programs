#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="clipboard-bin"
gives="clipboard"
pkgver="0.9.0.1"
pkgdesc="Cut, copy, and paste anything in your terminal"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
arch=("amd64" "arm64" "armhf" "ppc64el" "riscv64")
repology=("project: clipboard")
source=("https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${gives}-linux-${CARCH}.zip")
sha256sums_amd64=("5b90cd7299c1c0d679cfe8c1bd4e89e7fd70ebede2890d90a6f1da98a90e922b")
sha256sums_arm64=("07493b5e9954585160fc54314e23e4897652f06594f6ec7ceba66b32d7f72b82")
sha256sums_armhf=("7654d6f5176e554ed86d84f16924b2ec3d7a7e0000f24a43ee6772397b986dea")
sha256sums_ppc64el=("a7c2c689a777d57fe6638a469c408753d1b4d5d61c8fecd141a4781f54a24e7a")
sha256sums_riscv64=("e92f2c4eeeefd093d25f91f186c1c3ac572ea254369fe7028928246d431407c8")


package() {
  cd "${_archive}"
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm 755 "lib/libcbwayland.so" "${pkgdir}/usr/lib/libcbwayland.so"
  fi
  install -Dm 755 "lib/libcbx11.so" "${pkgdir}/usr/lib/libcbx11.so"

  install -Dm 755 "bin/cb" "${pkgdir}/usr/bin/cb"
}

# vim:set ft=sh ts=2 sw=2 et:
