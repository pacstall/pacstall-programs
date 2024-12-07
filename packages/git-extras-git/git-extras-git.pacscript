pkgname="git-extras-git"
gives="git-extras"
breaks=("${gives}-bin")
replaces=("${gives}")
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
source=("https://github.com/tj/git-extras.git")
arch=("all")
pkgver="7.0.0"
depends=("git" "bsdmainutils")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "git-extras"
  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
