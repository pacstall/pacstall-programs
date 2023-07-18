name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.5.0-060500rc2-generic"
version="6.5-rc2"
buildver="6.5.0-060500rc2.202307162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="55dfecf653c69a35e4927a5120da56639b86689d64265cd69e6ffaea5434658d"
  arch=('arm64')
else
  hash="5699eee3977d395e24d3df27d92da78e1fbe0bc9f504bee418216d5a2ec8ece6"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
