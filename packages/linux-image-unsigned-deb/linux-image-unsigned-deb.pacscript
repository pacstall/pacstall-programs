name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.8.0-060800rc6-generic"
pkgver="6.8-rc6"
buildver="6.8.0-060800rc6.202402251933"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="6bf63efc38d9f78442f625bfb7b22a086ebaad9fd29bad417677ee4d75afc5e5"
else
  hash="7f20e667c4020b8e238b8076973da01fbc5f1fc8cb0fa028b93d4199da7ff42c"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
