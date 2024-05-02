pkgname="lf-bin"
gives="lf"
repology=("project: ${gives}")
pkgver="31"
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Terminal file manager written in Go"
arch=('amd64' 'i386' 'arm64' 'armhf' 'mips' 'mips64el' 'ppc64' 'ppc64el' 's390x')
maintainer=("Romario <romariorobby@yahoo.com>")



source=("https://github.com/gokcehan/${gives}/releases/download/r${pkgver}/${gives}-linux-${archname:-${CARCH}}.tar.gz")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
