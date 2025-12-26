# https://github.com/dandavison/delta
# delta's deb package name conflicts with ubuntu's delta package. So deb package name is git-delta.
pkgname="git-delta-deb"
pkgver="0.18.2"
gives="git-delta"
source=("https://github.com/dandavison/delta/releases/download/${pkgver}/git-delta_${pkgver}_amd64.deb")
pkgdesc="A viewer for git and diff output"
sha256sums=("1658c7b61825d411b50734f34016101309e4b6e7f5799944cf8e4ac542cebd7f")
arch=('amd64')
incompatible=('debian:bullseye')
repology=("project: git-delta")
