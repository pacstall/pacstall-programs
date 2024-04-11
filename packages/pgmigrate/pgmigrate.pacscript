pkgname="pgmigrate"
repology=("project: ${pkgname}")
breaks="${pkgname}-git"
replaces=("${pkgname}")
pkgver="1.0.7"
source=("https://github.com/yandex/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
depends=("python3" "python3-sqlparse" "python3-yaml" "python3-psycopg2")
makedepends=("python3-setuptools")
pkgdesc="Simple tool to evolve PostgreSQL schema easily"
sha256sums=("ba39ee6198b1132a5306c3cce79d16644c507d7be999fbcc9c039cd3307693f6")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${_archive}"
  python3 setup.py build
}

package() {
  cd "${_archive}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
