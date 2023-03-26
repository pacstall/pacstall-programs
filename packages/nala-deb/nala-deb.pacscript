name="nala-deb"
version="0.12.3"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
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
  hash="7d57a4d40ea0b0f438a9b03e2e3ad14c95af6188731973b470aaf78a04d37796"
  arch=('any')
fi
