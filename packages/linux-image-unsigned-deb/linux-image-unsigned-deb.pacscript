name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.8.0-060800-generic"
pkgver="6.8"
buildver="6.8.0-060800.202403131158"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="a46103f8a26d2298fdb650dcffea9ff031af89cf4caab6fd12ac5890c794eb42"
else
  hash="da5112cb717a4be69a0d903996addc0ad2ffdae7672d835e617624bc5def53c2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
pacdeps=("linux-headers-generic-deb" "linux-modules-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
