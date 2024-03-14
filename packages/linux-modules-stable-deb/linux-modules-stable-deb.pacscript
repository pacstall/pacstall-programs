name="linux-modules-stable-deb"
gives="linux-modules-6.8.0-060800-generic"
pkgver="6.8"
buildver="6.8.0-060800.202403131158"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="a147fd53712468d3f002a4981d6a686ad46f2a6086c82f71d5f28cb56dcb434d"
else
  hash="26b4c1fdc6244353a4bc4bc10bae11bab3e7bc09426e114df5af72bae42ea5f3"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
