name="linux-modules-stable-deb"
gives="linux-modules-6.7.1-060701-generic"
pkgver="6.7.1"
buildver="6.7.1-060701.202401201133"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="aa7a4ca6c0f1aa647c77d7578d3b873725e0797c0a30078a590b6275dd5815b0"
else
  hash="499ebb2c77f90c83f04700a3194dc82979578f02061f4ef72cc43f49555691e2"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
