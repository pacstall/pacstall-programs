name="linux-headers-generic-stable-deb"
gives="linux-headers-6.5.0-060500-generic"
pkgver="6.5.0"
buildver="6.5.0-060500.202308271831"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="1997b4f8c51d4d09e1d15d1dc8626eb5d25ed5c5b8df017c85a9e3f3a9dd6976"
else
  hash="8892ba0c12ce4b7f8db43fc7cfd9b6df1090407e3d9de56e7b661cd1aa080d77"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
