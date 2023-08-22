name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.31.0"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
   hash="ac6d125bb9890fdcd272a4cda42f67a344c5f5459e7247fc23af8813f69f9821"
 else
   hash="3d33982fbf55878c370aa2c0cb48b7738de3dc43b154763e82352fbd7fa17ada"
 fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
