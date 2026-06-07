pkgname="git-credential-manager-core-deb"
gives="gcm"
repology=("project: ${gives}")
pkgver="2.8.0"
depends=("git")
arch=('amd64')
_url_arch=$([[ ${arch[0]} == "amd64" ]] && echo "x64" || echo "${arch[0]}")
source=("https://github.com/git-ecosystem/git-credential-manager/releases/download/v${pkgver}/${gives}-linux-${_url_arch}-${pkgver}.deb")
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services"
sha256sums=("c7bbf9785c3e8166ceedb66a7e0bfb40e6655ef504af5ca7977b516c5497aff6")
maintainer=("Oren Klopfer <oren@taumoda.com>")
