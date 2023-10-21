name="linux-modules-stable-deb"
gives="linux-modules-6.5.6-060506-generic"
pkgver="6.5.6"
buildver="6.5.6-060506.202310061235"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="bbfcc3e9bc8b7310eda5c2598139c8d8a4019199515e1cd1e5cbd184de5d2ab0"
else
  hash="614a8d4f2cf272719dfd0dd36c64bd751a61ff7deff270c7cfc2da3a1f1e3fdf"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
