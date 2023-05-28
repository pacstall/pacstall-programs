name="nala-deb"
version="0.13.0"
pkgname="nala"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-bin" "${pkgname}-app")
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

# shellcheck disable=SC2076
if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_0.11.0_amd64.deb"
  hash="61958e4677bcc38fabcfe0d740e2e6817046b5509be99648c337aa2c73fed21b"
  arch=('amd64')
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="a76a22910b9c67c857fcd9344f4e5d00bcb21321bfb0ecc50ea759a794e35d07"
  arch=('any')
fi
