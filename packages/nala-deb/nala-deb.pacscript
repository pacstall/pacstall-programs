name="nala-deb"
version="0.9.1"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_${version}_amd64.deb"
  hash="183bd51167825460123c88f271f0cd5cd0d1ddad2672647f19c901c604ff9883"
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="52a3d5f0d9cd548b1e4755839aba7a46f5cd872edadd3dc51e045912b2d89a50"
fi
