name="linux-modules-deb"
gives="linux-modules-6.3.0-060300rc7-generic"
version="6.3.0-rc7"
buildver="6.3.0-060300rc7.202304162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="535fa4ab3db34cec0d06d568e96a6c5f972ef8cb309e8b48437f6333ccd92224"
  arch=('arm64')
else
  hash="76d467a9865a75d11ad02cec108873a3b527f1df376d313993acaa3b4a1b3756"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
