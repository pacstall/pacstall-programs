name="git-extras-git"
gives="git-extras"
breaks=("${gives}-bin")
replace=("${gives}")
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
