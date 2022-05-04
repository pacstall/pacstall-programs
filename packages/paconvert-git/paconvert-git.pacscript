name="paconvert-git"
gives="paconvert"
breaks="${gives}-deb ${gives}-bin ${gives}-app ${gives}-git"
url="https://github.com/pacstall/paconvert.git"
description="Paconvert makes converting PKGBUILDS into pacscripts easier."
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
pkgdir="${STOWDIR}/${name}"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  sudo mkdir -p "${pkgdir}/usr/bin"
}

build() {
  true
}

install() {
  sudo install -Dm755 ./paconvert "${pkgdir}/usr/bin/paconvert"
}
