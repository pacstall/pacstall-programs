name="linux-modules-stable-deb"
gives="linux-modules-6.7.6-060706-generic"
pkgver="6.7.6"
buildver="6.7.6-060706.202402230933"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="7386f4f6cb8a2bc1163e7401b37b0fa49f75eabd5b67053634f2ad77e16bf6bf"
else
  hash="5f22742efff94fa5ed8afc426b251d8e9b1a4d2b04e84f484e97c76f0b8eaae1"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
