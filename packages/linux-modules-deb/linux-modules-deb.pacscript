name="linux-modules-deb"
gives="linux-modules-6.7.0-060700rc5-generic"
pkgver="6.7-rc5"
buildver="6.7.0-060700rc5.202312102332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="6570feaf3c00e5ea54faaf617cff10c4cfc2a706096a73228d5d3c3f1929625e"
else
  hash="3c4e2b95bb8d0395330af2177420873703b0800a608b9b292d7b2568b320e882"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
