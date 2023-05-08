name="linux-modules-stable-deb"
gives="linux-modules-6.3.1-060301-generic"
version="6.3.1"
buildver="6.3.1-060301.202304302031"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3ebb55b4922e8d93e43e8c8e20803cd67e0a1ad06593c3b2610fceaee1571d12"
  arch=('arm64')
else
  hash="7e3465ff7f1cd95cc65bcc659fa79bdf1e6e8ec9e9740b1e25acb295ec04ab7d"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
