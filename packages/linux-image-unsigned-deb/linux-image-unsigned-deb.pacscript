name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700-generic"
pkgver="6.7"
buildver="6.7.0-060700.202401072033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="fd2365b439cc0fef62a703b16e9ff9a6ec7ba86914e64c737e35a0d0c4274867"
else
  hash="dc8308152986ea5eb1aaa7d424a8461843062ec2acf2cc8bb6d1ca4e812f45af"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
