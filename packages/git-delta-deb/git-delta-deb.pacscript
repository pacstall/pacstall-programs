# https://github.com/dandavison/delta
# delta's deb package name conflicts with ubuntu's delta package. So deb package name is git-delta.
name="git-delta-deb"
version="0.15.1"
pkgname="git-delta"
gives="git-delta"
url="https://github.com/dandavison/delta/releases/download/${version}/git-delta_${version}_amd64.deb"
description="A viewer for git and diff output"
hash="f0db00a10972c953cd54cc00a0a3c87d547e87ceffc17b3e89721a803742b664"
arch=('amd64')
incompatible=('debian:bullseye')
repology=("project: git-delta")
