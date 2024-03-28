name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.9.0-060900rc1-generic"
pkgver="6.9~rc1"
buildver="6.9.0-060900rc1.202403242136"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="9d78882ed826d1566eb8f5c5ba5de7be010aab654b1174ca15a9c7677b6b3cda"
else
  hash="91d70d7751b66eeb052e49023f0c2d921bc887b895356b1f3ad033f14430c168"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
pacdeps=("linux-headers-generic-deb" "linux-modules-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
