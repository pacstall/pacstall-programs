name="linux-headers-generic-stable-deb"
gives="linux-headers-6.3.4-060304-generic"
version="6.3.4"
buildver="6.3.4-060304.202305241735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="1ac8ef12a7ed5b791523d99c45da18ffe75a36946444093fd8bfd8ee9a5b81d0"
  arch=('arm64')
else
  hash="3618177dacd3ec70354bdedf25949b3f9a23fc93e0a86cf98973b502bfc1f9f7"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
