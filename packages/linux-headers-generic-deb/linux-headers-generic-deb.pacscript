name="linux-headers-generic-deb"
gives="linux-headers-6.6.0-060600rc2-generic"
pkgver="6.6-rc2"
buildver="6.6.0-060600rc2.202309171834"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="30cc3ab6b582eedd0059a0e2808a6a6341a952f8796764b6da5dcede0988536b"
else
  hash="25865529eb6eba60ec6ac82d95a163e508f015a451baa48da4e2ef297e8b320b"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
