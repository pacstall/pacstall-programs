name="linux-modules-stable-deb"
gives="linux-modules-6.4.8-060408-generic"
pkgver="6.4.8"
buildver="6.4.8-060408.202308041557"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3f9b1ac2aac2646018f358c7c061d161d801b4cf19372e8f7056bc33e3cd9ff7"
  arch=('arm64')
else
  hash="a4f6e9aaed29393f7f8c64326433cc8d2bd88c9293f41568b6df1360e62992dc"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
