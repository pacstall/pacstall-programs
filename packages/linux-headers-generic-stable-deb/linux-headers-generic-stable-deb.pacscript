name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.8-060408-generic"
version="6.4.8"
buildver="6.4.8-060408.202308041557"
if [[ ${CARCH} == "arm64" ]]; then
  hash="adf85a97c411dbce2ef0de41ac84d71fade52711639ae5860134681a23f47e56"
  arch=('arm64')
else
  hash="52468bf57caf0304076f5485b1e229baa52c8ac311a9ae79a25890ae8933b172"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
