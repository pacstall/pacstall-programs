pkgname='eqwalizer'
pkgver='0.25.3'
pkgdesc='A type-checker for Erlang'
license=('Apache-2.0')
repology=("project: ${pkgname}")
url='https://github.com/WhatsApp/eqwalizer'
arch=('all')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/WhatsApp/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('280721884157fa38ab959e87c0031910f067c3b8bf539497edd188def5edd035')
makedepends=('openjdk-8-jdk-headless | openjdk-11-jdk-headless | openjdk-17-jdk-headless | openjdk-21-jdk-headless' 'scala')
depends=('openjdk-8-jre-headless | openjdk-11-jre-headless | openjdk-17-jre-headless | openjdk-21-jre-headless')
external_connection=true

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  sbt assembly
}

package() {
  install -Dm644 "$(find "${srcdir}/${pkgname}-${pkgver}" -name 'eqwalizer.jar' | head -1)" "${pkgdir}/usr/share/java/eqwalizer.jar"
  echo -e '#!/bin/sh\njava -jar /usr/share/java/eqwalizer.jar $@' > "${srcdir}/eqwalizer"
  install -Dm755 "${srcdir}/eqwalizer" "${pkgdir}/usr/local/bin/eqwalizer"
}
