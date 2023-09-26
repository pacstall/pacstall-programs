name="linux-modules-deb"
gives="linux-modules-6.6.0-060600rc2-generic"
pkgver="6.6-rc2"
buildver="6.6.0-060600rc2.202309171834"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="bf8018ae730a13114e35814642157abed3ce357ddd3240833345e024cc8d087c"
else
  hash="04f874248dd63ca918218ef85e21f49dd6a02fb6a2b891c0784e0ebbc915ada5"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
