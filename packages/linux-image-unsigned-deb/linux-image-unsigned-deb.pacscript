name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.5.0-060500rc1-generic"
version="6.5-rc1"
buildver="6.5.0-060500rc1.202307092131"
if [[ ${CARCH} == "arm64" ]]; then
  hash="84c179237b3a7e00b8af58da3811c525ef52423d85272c399c48b2f286406e95"
  arch=('arm64')
else
  hash="f95f67fcfc5515b825c7b687f5f5361b739fe64fe63a45f0a1b0160abcf9faf9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
