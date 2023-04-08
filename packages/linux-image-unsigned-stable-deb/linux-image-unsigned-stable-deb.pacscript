name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.2.10-060210-generic"
version="6.2.10"
buildver="6.2.10-060210.202304061139"
if [[ ${CARCH} == "arm64" ]]; then
   hash="d05e447f2499618185aaa42347cfaf025c2d8ad4dde3ba2e9f0e02828db2a717"
   arch=('arm64');
 else
   hash="baf34e07ceca80dad05fd105429f800e239dd1a9faf3e97dc1907851460ef31c"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
