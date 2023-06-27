name="linux-modules-stable-deb"
gives="linux-modules-6.3.9-060309-generic"
version="6.3.9"
buildver="6.3.9-060309.202306271338"
if [[ ${CARCH} == "arm64" ]]; then
  hash="f56f612bc320cd9369cccd8c896fdad9fe06cfa9d0beb88f2ec3dce0f3e97431"
  arch=('arm64')
else
  hash="a96eb09307617619d85c1034f5f5138b2a91be457cefe88a695753801f342746"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
