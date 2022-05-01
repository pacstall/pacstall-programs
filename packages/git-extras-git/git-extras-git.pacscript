name="git-extras-git"
pkgname="git-extras"
breaks="${pkgname}-bin"
replace="${pkgname}"
description="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
url="https://github.com/tj/git-extras.git"
depends="git"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo make DESTDIR="${STOWDIR}/${name}" PREFIX=/usr SYSCONFDIR=/etc install
}
