name="linux-headers-generic-stable-deb"
gives="linux-headers-6.8.4-060804-generic"
pkgver="6.8.4"
buildver="6.8.4-060804.202404041833"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="770cc49f266eb676bcd87402cf48e1fb8816f3c1ca2bae5163fe809b63a6d4c3"
else
  hash="2f45e52f9d85845db80a9d92d69f527203b08d1582437a42a8ff78a3530ae837"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
pacdeps=("linux-headers-stable-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
