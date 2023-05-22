name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.4.0-060400rc1-generic"
version="6.4-rc1"
buildver="6.4.0-060400rc1.202305072134"
if [[ ${CARCH} == "arm64" ]]; then
  hash="8e8d2a37b00e8f4d17559fe3dcbe2bcfa346418da0c438943d29c08007da1950"
  arch=('arm64')
else
  hash="2cef9587c313c4a59947e3bd568680a9b6eda4590cbde77d61491f28b963f98e"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
