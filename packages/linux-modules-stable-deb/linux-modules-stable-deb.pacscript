name="linux-modules-stable-deb"
gives="linux-modules-6.6.4-060604-generic"
pkgver="6.6.4"
buildver="6.6.4-060604.202312030734"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="a187fc1cdc36c26fd85f9e540a92d38987650f37676e5a1589b0a9a54a7c9cab"
else
  hash="0d79ea381ba7e01a42479bee237facad6fc6297f9ab7397517cb0860a5fa7ec6"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
