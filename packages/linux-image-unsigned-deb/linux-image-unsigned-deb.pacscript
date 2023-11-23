name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700rc2-generic"
pkgver="6.7-rc2"
buildver="6.7.0-060700rc2.202311192332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="2f0592626721c8276f155630f251fdefe61f6bff0d5d472603af2b49f1506d07"
else
  hash="eed62363b38e23ee5961d5c8255a81d539e93ef94c23b2c0cc47ccb44c9be9d2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
