name="linux-modules-deb"
gives="linux-modules-6.7.0-060700rc1-generic"
pkgver="6.7-rc1"
buildver="6.7.0-060700rc1.202311152246"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="ed0da693c9c3dfc638274323c059e95aaa06747fbb9a18a6cdf3902488bbb261"
else
  hash="ce94631f3254dfce03318428351c9d16316e016a9141a7bb7ea8621d9f4f3272"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
