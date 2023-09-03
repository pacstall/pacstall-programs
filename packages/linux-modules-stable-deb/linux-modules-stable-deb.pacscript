name="linux-modules-stable-deb"
gives="linux-modules-6.5.1-060501-generic"
pkgver="6.5.1"
buildver="6.5.1-060501.202309020842"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="eb6f1b4d55ce761cd1eecbaa073663a9823a1f6ef2264b306a95d89f3958e771"
else
  hash="3da769839bc792637c58cc7f05d9b6d99a811cf465d1f71becf1ccf606848f38"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
