name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.42.1"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="6eb3eac5eeb4467d74d917bea96a50a40cc6c3ac70b853f537c9843c3a551623"
else
  hash="2b053228c8fd7902054cddd44015a77446c014652d5257a2150c694843c7fa36"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
