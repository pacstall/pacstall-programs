# https://github.com/dandavison/delta
# delta's deb package name conflicts with ubuntu's delta package. So deb package name is git-delta.
name="git-delta-deb"
pkgver="0.16.5"
pkgname="git-delta"
gives="git-delta"
source=("https://github.com/dandavison/delta/releases/download/${pkgver}/git-delta_${pkgver}_amd64.deb")
pkgdesc="A viewer for git and diff output"
hash=("5ff245b2c66510b746e68bfdda65f31a66c9c79d10d2a8241c19cbceb12d3caa")
arch=('amd64')
incompatible=('debian:bullseye')
repology=("project: git-delta")
