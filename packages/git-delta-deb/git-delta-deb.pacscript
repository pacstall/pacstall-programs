# https://github.com/dandavison/delta
# delta's deb package name conflicts with ubuntu's delta package. So deb package name is git-delta.
pkgname="git-delta-deb"
pkgver="0.19.2"
gives="git-delta"
source=("https://github.com/dandavison/delta/releases/download/${pkgver}/git-delta_${pkgver}_amd64.deb")
pkgdesc="A viewer for git and diff output"
sha256sums=("ea4f0222950ee750a3d38dd80d03bce4cee07a3f63928fc47548383bcaf23093")
arch=('amd64')
incompatible=('debian:bullseye')
repology=("project: git-delta")
