pkgname="meson-git"
gives="meson"
pkgver="1.5"
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend with debian-meson forked from arch-meson"
arch=(any)
url='http://mesonbuild.com/'
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
  "068e89ba65b42b852f9760a518c2a5bcda0ff261e5eb3f2b058f721908f10821"
  "2458de83270d35bc9c5104a622c595030305c9093e74cbd415a91754db2228c9"
  "a1fa7d0c3113776337a7e875a35d7cf625000d98024ad4537af23f719c50bfa4")
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
