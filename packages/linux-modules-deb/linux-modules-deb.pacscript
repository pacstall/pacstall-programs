name="linux-modules-deb"
gives="linux-modules-6.7.0-060700rc6-generic"
pkgver="6.7-rc6"
buildver="6.7.0-060700rc6.202312172332"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="d08bb50346fe34fbfd7dedbc0151e1df7bb4309941a5055899804a3cd520d13b"
else
  hash="45b67553c4f114793fc4900533a1e45e96a57eed3c39d3a726143bec69f3de1b"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
