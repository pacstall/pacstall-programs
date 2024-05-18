pkgname="libssl1.1-deb"
gives="libssl1.1"
breaks=("${gives}-bin" "${gives}")
repology=("project: ${gives}")
replaces=("${gives}")
pkgver="1.1.1"
arch=('amd64')
pkgdesc="Libssl1.1 is a library that provides cryptographic functions for the OpenSSL software suite"
source=("http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/${gives}_${pkgver}-1ubuntu2.1~18.04.23_amd64.deb")
sha256sums=("986727f5a99088bef98971edfcd9567f5693b5e941aa241894fce1020c7015a0")
maintainer=("Rémy Huet <remy.huet@hds.utc.fr>")

# vim:set ft=sh ts=2 sw=2 et:
