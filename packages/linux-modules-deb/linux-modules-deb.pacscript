name="linux-modules-deb"
gives="linux-modules-6.6.0-060600rc5-generic"
pkgver="6.6-rc5"
buildver="6.6.0-060600rc5.202310081731"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="abd725cd3acb0e6670767cbb4c394a61eae8b72f66a9cfe5b432899afa9a00e6"
else
  hash="4ea1f34bb1085e5bb55a39f2970aa37f26fbe9ce8005455c50e7e3f29f9b0ad7"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
