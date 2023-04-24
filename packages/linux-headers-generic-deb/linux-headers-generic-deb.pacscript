name="linux-headers-generic-deb"
gives="linux-headers-6.3.0-060300-generic"
version="6.3.0"
buildver="6.3.0-060300.202304232030"
if [[ ${CARCH} == "arm64" ]]; then
  hash="9009bc021261e89214c1548d1ff22a9dd493c8ef4266f57f72f68a4f712c2f62"
  arch=('arm64')
else
  hash="8231893ac6333466f41c6eec898d4137fcf11c23bda9f8bace12230c03ead845"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
