name="linux-headers-generic-deb"
gives="linux-headers-6.5.0-060500rc7-generic"
pkgver="6.5-rc7"
buildver="6.5.0-060500rc7.202308201631"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="f677c6a66813fe14b1cb38c22a38761c28f78165d261dfdfbac0582223a1a543"
else
  hash="be4425c725604b9de17770e4e19917581e9f5e3801f46cc2a00428142702cf06"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
