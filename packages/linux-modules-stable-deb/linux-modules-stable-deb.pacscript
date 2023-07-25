name="linux-modules-stable-deb"
gives="linux-modules-6.4.6-060406-generic"
version="6.4.6"
buildver="6.4.6-060406.202307241739"
if [[ ${CARCH} == "arm64" ]]; then
  hash="87813eac47cde4fb81ecda26bfba16a51fe3b7faf736e8a43685e4bebf566545"
  arch=('arm64')
else
  hash="2a7f476e49dd816639616cbcf8f7d868c8d7a02097a370c44b55a640210a5823"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
