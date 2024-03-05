name="git-extras-git"
pkgname="git-extras"
breaks=("${pkgname}-bin")
replaces=("${pkgname}")
gives="${pkgname}"
pkgdesc="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
source=("https://github.com/tj/git-extras.git")
pkgver="7.0.0"
depends=("git" "bsdmainutils")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
