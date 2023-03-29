name="linux-headers-generic-stable-deb"
gives="linux-headers-6.2.8-060208-generic"
version="6.2.8"
buildver="6.2.8-060208.202303220943"
if [[ $CARCH == arm64 ]]; then
   hash="04ef81b1d4b4811bb012f673004c43ffd626987f3db56229284e6d84eb9fc865"
   arch=('arm64');
 else
   hash="d3e2eca15c22c9d80e3eef2a8317e8ec0447301f9a2aece694a6afedd24e3fde"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
