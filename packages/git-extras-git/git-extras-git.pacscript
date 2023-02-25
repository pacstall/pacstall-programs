name="git-extras-git"
pkgname="git-extras"
breaks="${pkgname}-bin"
replace="${pkgname}"
gives="${pkgname}"
description="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
url="https://github.com/tj/git-extras.git"
depends="git bsdmainutils"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

install() {
  sudo make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
