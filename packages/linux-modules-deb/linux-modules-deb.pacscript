name="linux-modules-deb"
gives="linux-modules-6.3.0-060300-generic"
version="6.3.0"
buildver="6.3.0-060300.202304232030"
if [[ ${CARCH} == "arm64" ]]; then
  hash="4ee8ed65f986ca77efd9a5137a2ccb4edd6c02fcbb334946e2a112db7e93a3d3"
  arch=('arm64')
else
  hash="d4ff3d4011f59296a73903fbbe15be1129d093e15c718988e16bcb3d568609a9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
