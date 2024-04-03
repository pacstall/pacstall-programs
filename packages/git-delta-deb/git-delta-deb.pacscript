# https://github.com/dandavison/delta
# delta's deb package name conflicts with ubuntu's delta package. So deb package name is git-delta.
name="git-delta-deb"
pkgver="0.17.0"
pkgname="git-delta"
gives="git-delta"
url="https://github.com/dandavison/delta/releases/download/${pkgver}/git-delta_${pkgver}_amd64.deb"
pkgdesc="A viewer for git and diff output"
hash="e11c201107edc86212a8bfdf5ca51a7b5bd497008f1f57c4319a2746991ff7db"
arch=('amd64')
incompatible=('debian:bullseye')
repology=("project: git-delta")
