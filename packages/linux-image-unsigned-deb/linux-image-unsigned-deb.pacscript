name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700rc1-generic"
pkgver="6.7-rc1"
buildver="6.7.0-060700rc1.202311152246"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="4fb2eb61f34e8488bc6e459d58c494bda6a323b2095624d9193fc0a6b931a55f"
else
  hash="ddb0d5cca0ff946a002e891b872a916d0d042cf877e7a161f8d8b596c9840409"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
