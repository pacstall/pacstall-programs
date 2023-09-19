name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.33.0"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="8634cf87daf6c7a2a0b867710c949ba15c4331a62d2f99f712950d8504c8a62a"
else
  hash="ea18a92a3e0a2a8edbca8d5ef368829ec8ced37571e0eb9d2c074917b0c5faae"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
