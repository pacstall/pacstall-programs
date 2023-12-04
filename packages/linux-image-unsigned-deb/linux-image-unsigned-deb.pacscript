name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.7.0-060700rc4-generic"
pkgver="6.7-rc4"
buildver="6.7.0-060700rc4.202312031033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="0ac8b6d1ad1f8138d6991eb9fb7df67625f9882c6b7de0e502f08145c9496d0e"
else
  hash="dff954aeadd24879ff849cbd7f133571a2c928d00ae48e8ea3c40b4fad5c9500"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
