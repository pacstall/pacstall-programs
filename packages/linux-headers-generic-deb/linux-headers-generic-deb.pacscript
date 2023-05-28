name="linux-headers-generic-deb"
gives="linux-headers-6.4.0-060400rc4-generic"
version="6.4-rc4"
buildver="6.4.0-060400rc4.202305281232"
if [[ ${CARCH} == "arm64" ]]; then
  hash="f74eafa3b69d44c9a3370e3d586a5c365be04feac2a6c4fa3b9fb843ee7c96db"
  arch=('arm64')
else
  hash="871a74a34f6c9943034966b4af390eecef7e2ec54cc91957bfda3ecfe31df0ae"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
