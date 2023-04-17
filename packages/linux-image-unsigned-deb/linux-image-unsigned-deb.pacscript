name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.3.0-060300rc7-generic"
version="6.3.0-rc7"
buildver="6.3.0-060300rc7.202304162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="53f987a8461dd844bd7d43ecf3ec26558ae39b0f5307ed70143a7529ee4ee102"
  arch=('arm64')
else
  hash="90f4935a22be945167bf19d3fe193b085b34c5c35240fc832e40a348fc5ecc8a"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
