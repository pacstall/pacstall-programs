name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.38.0"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="a031d91d41253f1148aae8ad593ad826bf8c5d3c48ac306d13aec25edbba1f8a"
else
  hash="99893130047428ff94ac37434f3d3e76bfa3c10786ce9ec4ae91c4b38c406a61"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
