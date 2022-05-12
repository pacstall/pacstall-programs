name="nala-deb"
version="0.8.2"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('Bullseye' 'focal' 'impish')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_${version}_amd64.deb"
  hash="ef4dc8f6fa6f46a9dba6ac8567a5bb8e64af49d46d1ea408584a58bf3fbbf893"
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="5237555dff9804c9c357e6e470c6f90abc770354546f0cfc4a9fec96789125a1"
fi
