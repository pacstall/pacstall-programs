name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.6.6-060606-generic"
pkgver="6.6.6"
buildver="6.6.6-060606.202312111032"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="11ae7bdc2c1526788311d53eb1640509dde7b1c1a799febf384f08ec5d6c235a"
else
  hash="4cd9ed319fe1ead89f0ad5c69b6c2774c7057300d6decd22536c679abfd3a440"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
