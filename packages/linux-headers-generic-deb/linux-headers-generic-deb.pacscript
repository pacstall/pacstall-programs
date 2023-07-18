name="linux-headers-generic-deb"
gives="linux-headers-6.5.0-060500rc2-generic"
version="6.5-rc2"
buildver="6.5.0-060500rc2.202307162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="37d498637c7dc2fd97abaa4228fc156b5192a02b35dff46e4505707d5a6df5af"
  arch=('arm64')
else
  hash="3174639ea9a4f25292e779032c15451865b304685d391bc12bc25cf8cb458f5b"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
