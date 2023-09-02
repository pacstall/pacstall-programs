name="git-extras-git"
pkgname="git-extras"
breaks=("${pkgname}-bin")
replace=("${pkgname}")
gives="${pkgname}"
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
url="https://github.com/tj/git-extras.git"
pkgver="7.0.0"
depends=("git" "bsdmainutils")
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  sudo make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
