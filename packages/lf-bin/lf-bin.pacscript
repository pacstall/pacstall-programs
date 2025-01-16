pkgname="lf-bin"
gives="lf"
repology=("project: ${gives}")
pkgver="31"
pkgrel="2"
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Terminal file manager written in Go"
arch=('amd64' 'i386' 'arm64' 'armhf' 'mips64el' 'ppc64el' 's390x')
maintainer=("Romario <romariorobby@yahoo.com>")

source=("https://github.com/gokcehan/${gives}/releases/download/r${pkgver}/${gives}-linux-${CARCH}.tar.gz")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
