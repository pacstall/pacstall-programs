pkgname='xdg-ninja-git'
gives='xdg-ninja'
arch=("all")
pkgver='0.2.0.2'
# shellcheck disable=SC2016
pkgdesc='A shell script which checks your $HOME for unwanted files and directories.'
url="https://github.com/b3nj5m1n/${gives}"
license=('MIT')
depends=('jq')
pacdeps=('glow-deb')
source=("${gives}::${url}.git")
repology=("project: ${gives}")

package() {
  make install -C "${srcdir}/${gives}" DESTDIR="${pkgdir}" PREFIX=/usr
}
