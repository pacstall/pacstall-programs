name="linux-modules-stable-deb"
gives="linux-modules-6.7.0-060700-generic"
pkgver="6.7"
buildver="6.7.0-060700.202401072033"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="32825359fc954c3d7865e5a4d899b167647b0abff0a4ee775dc2b4bcd447600a"
else
  hash="02e5c37cee2ec7ecfb103332fc99017e03f54710506251f9b1ba45f004c7b3ce"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
