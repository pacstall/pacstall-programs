name="linux-modules-deb"
gives="linux-modules-6.4.0-060400rc3-generic"
version="6.4-rc3"
buildver="6.4.0-060400rc3.202305212230"
if [[ ${CARCH} == "arm64" ]]; then
  hash="880c06191cad12f1d64ee42ba66f9e025def9337131e6461b81be5d873b2944a"
  arch=('arm64')
else
  hash="a3ed81c52521082a8cdce58b9a48c8346a39adc13b874bcd9a592c4779b09b10"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
