name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.9.0-060900rc6-generic"
pkgver="6.9~rc6"
buildver="6.9.0-060900rc6.202404282134"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="fcaf757824b571e1fa8dd99b31ef708131b153377a3d353482d07879fe73d63b"
else
  hash="48013764c08080470b70378d1650857a775f6544c8bdf4e0c5da686afc260709"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
pacdeps=("linux-headers-generic-deb" "linux-modules-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
