name="linux-headers-generic-deb"
gives="linux-headers-6.5.0-060500rc1-generic"
version="6.5-rc1"
buildver="6.5.0-060500rc1.202307092131"
if [[ ${CARCH} == "arm64" ]]; then
  hash="20688665411fdc9e60d7f0735792917dbc6d3b655de5db8f43f957a200eafd26"
  arch=('arm64')
else
  hash="aeb1e453714d47fafe671f85c143d77e135504a66cdac9517f4bf2d88e7e1b6a"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
