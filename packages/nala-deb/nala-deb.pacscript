name="nala-deb"
version="0.11.0"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_${version}_amd64.deb"
  hash="61958e4677bcc38fabcfe0d740e2e6817046b5509be99648c337aa2c73fed21b"
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="8aae16225504d74d9581200199336a32fb7d2d56445e6fd8642d510a2ede9050"
fi
