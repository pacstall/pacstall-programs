name="nala-deb"
pkgver="0.14.0"
gives="nala"
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-app")
pkgdesc="Commandline frontend for the apt package manager"
maintainer="Blake Lee <blake@volian.org>"

release="$(lsb_release -cs)"
nala_next=('bullseye' 'focal' 'impish')

# shellcheck disable=SC2076
if [[ " ${nala_next[*]} " =~ " ${release} " ]]; then
  url="https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_0.11.0_amd64.deb"
  hash="61958e4677bcc38fabcfe0d740e2e6817046b5509be99648c337aa2c73fed21b"
  arch=('amd64')
else
  url="https://deb.volian.org/volian/pool/main/n/nala/nala_${pkgver}_all.deb"
  hash="c209eaa9e3d9ccfbcbda3fe8cda786124f5c1abbf4864f7591fd418da4c0e909"
  arch=('any')
fi
