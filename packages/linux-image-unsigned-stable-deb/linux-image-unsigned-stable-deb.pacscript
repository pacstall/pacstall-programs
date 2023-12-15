name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.6.7-060607-generic"
pkgver="6.6.7"
buildver="6.6.7-060607.202312131837"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d77a386f45403c6c923a7a30f0e8ff68d78636dfe94b721ec61d841419c1d334"
else
  hash="15c6786dbe22c13c2410151aba904fb7f79a294e93eac308d552cd001a7677e7"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
