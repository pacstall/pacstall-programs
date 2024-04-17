name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.9.0-060900rc4-generic"
pkgver="6.9~rc4"
buildver="6.9.0-060900rc4.202404142134"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d4ef493d68135903373b723bb398bca5d3edd0544a06d253a8f0404e696fa69c"
else
  hash="a183e81addfd45cccf6aea185a683bfb2160ec8bef9b8c736a6d8503e3888913"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver/\~/-}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Unsigned image)"
pacdeps=("linux-headers-generic-deb" "linux-modules-deb")
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
