name="libssl1.1-deb"
gives="libssl1.1"
breaks=("${gives}-bin" "${gives}")
repology=("project: ${gives}")
replace=("${gives}")
pkgver="1.1.1"
arch=('amd64')
pkgdesc="Libssl1.1 is a library that provides cryptographic functions for the OpenSSL software suite"
url="http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/${gives}_${pkgver}-1ubuntu2.1~18.04.23_amd64.deb"
hash="986727f5a99088bef98971edfcd9567f5693b5e941aa241894fce1020c7015a0"
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"

# vim:set ft=sh ts=2 sw=2 et:
