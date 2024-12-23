pkgname="shellcheck-bin"
gives="shellcheck"
pkgver="0.9.0"
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
pkgdesc="Gives warnings and suggestions for bash/sh shell scripts"
sha256sums=("700324c6dd0ebea0117591c6cc9d7350d9c7c5c287acbad7630fa17b1d4d9e2f")
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
