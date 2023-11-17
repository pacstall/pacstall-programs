name="linux-modules-stable-deb"
gives="linux-modules-6.6.0-060600-generic"
pkgver="6.6"
buildver="6.6.0-060600.202311151808"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="b683d282cafad3cf87c2f9d5295638c177009f8a9cae4fb9387e095b44be0012"
else
  hash="c8569e890db4d7d0eb7e76dd333dca3ed81636f6e814a28941734faaf722b543"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
