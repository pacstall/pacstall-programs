name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.7.6-060706-generic"
pkgver="6.7.6"
buildver="6.7.6-060706.202402230933"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="e32134c55d3a45e901cb3a0fc0d48af1c4c75200ad60e023ac7fef53a05b8f37"
else
  hash="6f126bd72024437e3928d94b1c1f7a75914749eb0d985301f41771317351052e"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
