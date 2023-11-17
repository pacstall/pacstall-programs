name="linux-headers-generic-deb"
gives="linux-headers-6.7.0-060700rc1-generic"
pkgver="6.7-rc1"
buildver="6.7.0-060700rc1.202311152246"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d4b08940c22194d81e42d377a5929d21972780075b539d68761b8799f671361c"
else
  hash="d4c9dfc13289cd7377d787cba366910f0e2857c9c90c373b320fe1b989eedbab"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
