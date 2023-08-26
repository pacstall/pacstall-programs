maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
pkgver="2.9.12"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip"
hash="8ac4e7e349e8df857644ee54a13b087ee98368e48c2484df528e36f076f809fc"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
