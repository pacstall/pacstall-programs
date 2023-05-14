name="git-extras-git"
pkgname="git-extras"
breaks=("${pkgname}-bin")
replace=("${pkgname}")
gives="${pkgname}"
description="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
url="https://github.com/tj/git-extras.git"
depends=("git" "bsdmainutils")
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
