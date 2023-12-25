name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.40.1"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="06af3ff1cb2dd5b70888177388fbf128d1d3a90a590d43ff5424751d331fabac"
else
  hash="652a1ed8c411d6a5237fead3af210063dd8263035f0454720b7728a6f21e94e6"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
