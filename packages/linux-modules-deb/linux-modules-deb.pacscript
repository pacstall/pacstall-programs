name="linux-modules-deb"
gives="linux-modules-6.4.0-060400rc1-generic"
version="6.4-rc1"
buildver="6.4.0-060400rc1.202305072134"
if [[ ${CARCH} == "arm64" ]]; then
  hash="e7be33893ce3c78c138fec34ad16851ace2dbff1484c73aaf8ea4194f28dea8d"
  arch=('arm64')
else
  hash="4415cfd6fd35450a4c1624d329ab5bdf29c6006b32b8c9125c6856cdd1e5b4f5"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
