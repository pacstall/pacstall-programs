pkgname="git-credential-manager-core-deb"
gives="gcm"
repology=("project: ${gives}")
pkgver="2.9.1"
depends=("git")
arch=('amd64')
_url_arch=$([[ ${arch[0]} == "amd64" ]] && echo "x64" || echo "${arch[0]}")
source=("https://github.com/git-ecosystem/git-credential-manager/releases/download/v${pkgver}/${gives}-linux-${_url_arch}-${pkgver}.deb")
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services"
sha256sums=("a0c59d2ea873a930fd1c41031a25cb31055d31baaf80c10726847e1c1f7aa951")
maintainer=("Oren Klopfer <oren@taumoda.com>")
