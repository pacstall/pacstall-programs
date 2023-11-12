name="github-cli-deb"
gives="gh"
breaks=("${gives}-bin" "${gives}-git")
replace=("${gives}")
pkgver="2.38.0"
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="0dcf55087bbf7b2a23649b4117e2be9f8d5924fc287b75b92024bfdac97d837f"
else
  hash="64c40d1772570bfd1f1550b2000e6eefda644c72a67b0842d4d5602076c7f2fa"
fi
url="https://github.com/cli/cli/releases/download/v${pkgver}/${gives}_${pkgver}_linux_${CARCH}.deb"
pkgdesc="GitHub's official command line tool"
repology=("project: github-cli")
maintainer="Oren Klopfer <oren@taumoda.com>"
