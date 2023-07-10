name="linux-modules-deb"
gives="linux-modules-6.5.0-060500rc1-generic"
version="6.5-rc1"
buildver="6.5.0-060500rc1.202307092131"
if [[ ${CARCH} == "arm64" ]]; then
  hash="227b98e06bacb93c878e9d10ae3c404d5479eb0976bda50c24db396b4d4875ef"
  arch=('arm64')
else
  hash="bf45b1d5d6533c631d40e0009e9f2ac22c3e955b40cc81f5cfbaf6f13fd5c0f4"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
