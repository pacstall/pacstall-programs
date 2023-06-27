name="linux-headers-generic-stable-deb"
gives="linux-headers-6.3.9-060309-generic"
version="6.3.9"
buildver="6.3.9-060309.202306271338"
if [[ ${CARCH} == "arm64" ]]; then
  hash="5ff3151ff081831a9dab6eb22bda13225c1f5b1a5d87ec2584f2ffe20df5e8ac"
  arch=('arm64')
else
  hash="a5d5800570b151bd4d510b1f9876e3d58b194991c553a112b2b5959658367b8d"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
