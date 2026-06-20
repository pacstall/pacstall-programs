#!/usr/bin/bash
#-*- mode: sh-*-
maintainer=("Don Alfons <donnisnoni@outlook.com>")

pkgname="sesh-bin"
gives="sesh"
pkgver="2.26.2"
pkgdesc="Smart tmux session manager"
repology=("project: ${gives}")
arch=('arm64' 'amd64' 'i386')
depends=("zoxide")

sha256sums_amd64=("4a5cdd75a38c6e3167ab80d419a9973097b2f7e1b63c8150c4e6db8e40c6d803")
sha256sums_arm64=("4cd88d205ab07691e6bac05f7df3517998fc8fffd88806e23705da762da84224")
sha256sums_i386=("0b024035883f90376710f8545c3e39cb3e9183ae8024398be0135398e7d40cb0")

source_amd64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_x86_64.tar.gz")
source_arm64=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_arm64.tar.gz")
source_i386=("${pkgname}~${pkgver}::https://github.com/joshmedeski/sesh/releases/download/v${pkgver}/sesh_Linux_i386.tar.gz")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 sesh -t "${pkgdir}/usr/bin"
  if [[ -f share/man/man1/sesh.1 ]]; then
    install -Dm644 share/man/man1/sesh.1 -t "${pkgdir}/usr/share/man/man1"
  fi
}
