name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.3.0-060300rc4-generic"
version="6.3-rc4"
buildver="6.3.0-060300rc4.202303262231"
if [[ ${CARCH} == "arm64" ]]; then
  hash="42ed6c046f987efe73067f7059d92567a8f954d461796b548a79d9c00e2e74a6"
  arch=('arm64')
else
  hash="843e2342578402c50b280882668c3fa095da57e8de6364921af32fc4989d06b4"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
