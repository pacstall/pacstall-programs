name="linux-headers-generic-stable-deb"
gives="linux-headers-6.3.1-060301-generic"
version="6.3.1"
buildver="6.3.1-060301.202304302031"
if [[ ${CARCH} == "arm64" ]]; then
  hash="dd1b5110b8f917276633530f2e3c0d37a78ed95c35d523818a432d5d36613bc5"
  arch=('arm64')
else
  hash="a7dad940bef1b688717933168c90dfc06a9470aa99f520e522ed9126083e4fc8"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
