name="linux-modules-stable-deb"
gives="linux-modules-6.6.6-060606-generic"
pkgver="6.6.6"
buildver="6.6.6-060606.202312111032"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="82580866de84e8dff255652c40cb87f33d80b443d47c1a4d9ef57bc56e61e77a"
else
  hash="bb4cd1f2048c5d4fd7db9e591c98cfd873d0978410314f966e782e0de89d9af6"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
