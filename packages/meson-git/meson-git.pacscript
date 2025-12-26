pkgname="meson-git"
gives="meson"
pkgver="1.5"
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend with debian-meson forked from arch-meson"
arch=(any)
url='https://mesonbuild.com/'
depends=("python3" "ninja-build")
makedepends=(
  "git"
  "python3-build"
  "python3-installer"
  "python3-setuptools"
  "python3-wheel"
  "ninja-build"
  "python3-tqdm"
  "python3-typing-extensions"
)

source=("git+https://github.com/mesonbuild/meson"
  "debian-meson"
  "cross-lib32"
  "native-clang")
sha256sums=("SKIP"
  "eb944e481d3299bf9c3c79835697215885a32e0fc1f9c86e2b0699cdc4ee849e"
  "ba2be3874b2a30901741363cbdf412b85da9fd333cadaff19fdd9c6d276ec555"
  "b1c9b9e5d39f540ac1038a83e5716622d8e111b70be400a9a7c9561503ae03ac")
maintainer=("xdavius <xdavius@github.com>")

package() {
  cd "${srcdir}/${pkgname%-git}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  for _f in data/syntax-highlighting/vim/*/*; do
    install -Dt "${pkgdir}/usr/share/vim/vimfiles/$(basename "$(dirname "${_f}")")" -m644 "${_f}"
  done
  install -Dt "${pkgdir}/usr/share/zsh/site-functions" -m644 data/shell-completions/zsh/*
  install -Dm755 ../debian-meson -t "${pkgdir}/usr/bin"
  install -Dm644 ../cross-lib32 "${pkgdir}/usr/share/meson/cross/lib32"
  install -Dm644 ../native-clang "${pkgdir}/usr/share/meson/native/clang"
}
