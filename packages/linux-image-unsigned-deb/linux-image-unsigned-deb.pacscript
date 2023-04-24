name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.3.0-060300-generic"
version="6.3.0"
buildver="6.3.0-060300.202304232030"
if [[ ${CARCH} == "arm64" ]]; then
  hash="218cca4573d0900ca55f775b7587acccd13f5cb636be2c687904dc468a405a7b"
  arch=('arm64')
else
  hash="327f87babd8c2ae72357b75770725415ce8730867a74e40744ab69fc6b3f74ca"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
