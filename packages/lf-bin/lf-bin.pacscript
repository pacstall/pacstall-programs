pkgname="lf-bin"
gives="lf"
repology=("project: ${gives}")
pkgver="39"
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Terminal file manager written in Go"
arch=('amd64' 'i386' 'arm64' 'mips64el' 'ppc64el' 's390x')
maintainer=("Romario <romariorobby@yahoo.com>")
source_amd64=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_i386=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_arm64=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-arm64.tar.gz")
source_mips64el=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-mips64le.tar.gz")
source_ppc64el=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-ppc64le.tar.gz")
source_s390x=("https://github.com/gokcehan/lf/releases/download/r${pkgver}/lf-linux-s390x.tar.gz")
sha256sums_amd64=("e2d66edbf68c3b5db2414541d21618b09b1afcb90d7a2ad17db5ca368100e24a")
sha256sums_i386=("2f3ec85319625d49380a4bc2119cbfedf07c80cbad981e4e34e139871e1c8a3b")
sha256sums_arm64=("005a3358c59fc222a686f69acb94f93da5096b389af5c5a28fcb81dfd26367ca")
sha256sums_mips64el=("81aa50e243ec06eb8e80c17cbbd0415eea842a3600db86ba287889b52245cb4c")
sha256sums_ppc64el=("8ab8c90d1221301301415159b2559976b14c0af984e5a23ff887f7a6768304a2")
sha256sums_s390x=("3625b90bea3c7e0ee52e8b0f9d0d93f6ebfb2b0ce7edec162fe911c0522b694b")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
