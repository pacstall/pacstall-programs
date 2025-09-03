pkgname="shellcheck-bin"
gives="shellcheck"
pkgver="0.10.0"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
pkgdesc="Gives warnings and suggestions for bash/sh shell scripts"
sha256sums=("6c881ab0698e4e6ea235245f22832860544f17ba386442fe7e9d629f8cbedf87")
source=("@${pkgname}~${pkgver}::https://github.com/koalaman/shellcheck/releases/download/v${pkgver}/shellcheck-v${pkgver}.linux.x86_64.tar.xz")
url='https://www.shellcheck.net/'
arch=('amd64')
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: shellcheck")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 shellcheck "${pkgdir}/usr/bin/shellcheck"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
  chmod +x "${pkgdir}/usr/bin/shellcheck"
}
