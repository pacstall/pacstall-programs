name="linux-headers-generic-stable-deb"
gives="linux-headers-6.6.0-060600-generic"
pkgver="6.6"
buildver="6.6.0-060600.202311151808"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="cde4d270082b1509f4ec85b0f72f3d0be54c6d854ca56c162ccae22c8dc69e35"
else
  hash="2e3bddc8f241c3c8f8212abfbfe188c6adaae5038f78541dab60c2ef7241e948"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
