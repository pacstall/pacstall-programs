name="linux-headers-generic-stable-deb"
gives="linux-headers-6.3.2-060302-generic"
version="6.3.2"
buildver="6.3.2-060302.202305111150"
if [[ ${CARCH} == "arm64" ]]; then
  hash="79889ebca47e9d41253a18db8640ded30ddeaa72c18c242208832c1dbeaffe66"
  arch=('arm64')
else
  hash="8c851705922a921aca5a1ca8665793a9b0787579b4e50545ed60963df3ccbe13"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
