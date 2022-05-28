name="nala-deb"
version="0.9.0"
pkgname="nala"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app"
description="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_${version}_amd64.deb"
  hash="f5e780ee84a5e8dabf2fab52b305e791075069ec6d62a1e05f15d723d564a07c"
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${version}_all.deb"
  hash="172423eccf543b7719ca7ccd3406d732d8b894935190477f5ab2711f82ee07ed"
fi
