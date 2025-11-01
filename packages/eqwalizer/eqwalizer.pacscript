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
makedepends=('openjdk-8-jdk-headless | openjdk-11-jdk-headless | openjdk-17-jdk-headless')
depends=('openjdk-8-jre-headless | openjdk-11-jre-headless | openjdk-17-jre-headless')
pacdeps=('sbt-deb') # This is in reality only a makedepend, but to my knowledge Pacstall does not support "make-pac-deps"
external_connection=true

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  sbt assembly --java-home "$(find /usr/lib/jvm -regextype 'posix-extended' -regex "/usr/lib/jvm/java-(8|11|17)-openjdk-${CARCH}" | head -1)"
}

package() {
  install -Dm644 "$(find "${srcdir}/${pkgname}-${pkgver}" -name 'eqwalizer.jar' | head -1)" "${pkgdir}/usr/share/java/eqwalizer.jar"
  echo -e '#!/bin/sh\njava -jar /usr/share/java/eqwalizer.jar $@' > "${srcdir}/eqwalizer"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
  mkdir -p "${pkgdir}/usr/local/include/"
  cp -r "${srcdir}/${pkgname}-${pkgver}/${pkgname}_support" "${pkgdir}/usr/local/include/"
  echo -e "ELP_EQWALIZER_PATH=/usr/local/bin/${pkgname}\nEQWALIZER_SUPPORT_DIR=/usr/local/include/${pkgname}_support" > "${srcdir}/eqwalizer.conf"
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/environment.d/${pkgname}.conf"
}
