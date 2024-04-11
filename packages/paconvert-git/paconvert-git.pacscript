pkgname="paconvert-git"
gives="paconvert"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
source=("https://github.com/pacstall/paconvert.git")
pkgver="0.0.1"
pkgdesc="Paconvert makes converting PKGBUILDS into pacscripts easier."
maintainer=("cat-master21 <96554164+cat-master21@users.noreply.github.com>")

prepare() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/bin"
}

package() {
  cd "${_archive}"
  install -Dm755 ./paconvert "${pkgdir}/usr/bin/paconvert"
}
