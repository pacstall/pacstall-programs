name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.4.0-060400rc4-generic"
version="6.4-rc4"
buildver="6.4.0-060400rc4.202305281232"
if [[ ${CARCH} == "arm64" ]]; then
  hash="4f6d3ea0cf9dd517555e6b9ce4353437e7797820718436188820119b3ef41ca3"
  arch=('arm64')
else
  hash="675edf1a03145e1b89d20148889d12660ff8ec216a95c453f2118af67886b151"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
