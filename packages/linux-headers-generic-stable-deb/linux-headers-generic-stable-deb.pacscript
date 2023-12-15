name="linux-headers-generic-stable-deb"
gives="linux-headers-6.6.7-060607-generic"
pkgver="6.6.7"
buildver="6.6.7-060607.202312131837"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="0669b6159b44ffea11ad770aac910a51dd974f3c5d07c398c748d032bc8a5855"
else
  hash="2160d36a670d54869476f9e5134e24bc822d223b7aa915260e6c1c809652cb30"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
