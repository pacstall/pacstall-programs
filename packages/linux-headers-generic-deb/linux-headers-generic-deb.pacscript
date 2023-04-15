name="linux-headers-generic-deb"
gives="linux-headers-6.3.0-060300rc4-generic"
version="6.3-rc4"
buildver="6.3.0-060300rc4.202303262231"
if [[ ${CARCH} == "arm64" ]]; then
  hash="96ed11bb4d39e8e248aa7eb8a02637fe1995864ce8b20b37459d8048b48f1f35"
  arch=('arm64')
else
  hash="f2bc20bc76adcba139da2f43c9a1256c25651cbade2cda7acd9192614c5d9c7f"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
