name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.36.0"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="06f3943f9a48ab344ca92dfa0c9c190ce95dd4076dd3cfaa718d99bf71ae49c0"
else
  hash="a6f20316b627ab924447a6c7069edf64e33be20cccdb9b56b1952c7eb47eec2b"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
