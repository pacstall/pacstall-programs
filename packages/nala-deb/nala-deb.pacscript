name="nala-deb"
version="0.12.0"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_0.11.0_amd64.deb"
  hash="61958e4677bcc38fabcfe0d740e2e6817046b5509be99648c337aa2c73fed21b"
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="1c04aa1d46bec9f3ad80b07580e3d080fbe8dc1a6bf5729f912696ed692efe2e"
fi
