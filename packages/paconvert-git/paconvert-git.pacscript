name="paconvert-git"
gives="paconvert"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
url="https://github.com/pacstall/paconvert.git"
pkgver="0.0.1"
pkgdesc="Paconvert makes converting PKGBUILDS into pacscripts easier."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

package() {
  sudo install -Dm755 ./paconvert "${pkgdir}/usr/bin/paconvert"
}
