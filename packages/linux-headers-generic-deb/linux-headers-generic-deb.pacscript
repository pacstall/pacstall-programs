name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700rc5-generic"
pkgver="6.7-rc5"
buildver="6.7.0-060700rc5.202312102332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="58a5cd6b66810f7d41019f35a1df0e764cd103d34190f882b3fd3ff4910c78b2"
else
  hash="9adc5cb5d6cf64b015c00ff350854e2faba1962b13d6db8cccc47a3d7ac968d2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
