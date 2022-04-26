name="nala-deb"
version="0.8.1"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('sid' 'bookworm' 'jammy')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="2768052c4bb1b347c302b96ec0346776b1eb08e59f78b8b377654e6fe5771ec2"
else
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_${version}_amd64.deb"
  hash="73c304d24bf1cfe156c97d4cae832d115b720cae3bf2bc5386075c44645bcc88"
fi
