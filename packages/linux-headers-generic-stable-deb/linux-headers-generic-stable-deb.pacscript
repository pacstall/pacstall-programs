name="linux-headers-generic-stable-deb"
gives="linux-headers-6.7.6-060706-generic"
pkgver="6.7.6"
buildver="6.7.6-060706.202402230933"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="19ada4ec3832a53c57e27983c2dd12f05e998cc8954ad063f4a478d6c25c7175"
else
  hash="3a92dad5748d53dab8b00f02254a4f19faad59917c49d46d8c77536b214bc468"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
