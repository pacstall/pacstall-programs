name="linux-modules-deb"
gives="linux-modules-6.5.0-060500rc7-generic"
pkgver="6.5-rc7"
buildver="6.5.0-060500rc7.202308201631"
if [[ ${CARCH} == "arm64" ]]; then
  hash="6ca5de9646642220909cd396955aacca3e29349b48d831e157d02abe09b39a94"
  arch=('arm64')
else
  hash="d03efbb6b1c4831c05ea10dbc1e32c09f0c75d718c42c802925184bbf397cdc5"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
