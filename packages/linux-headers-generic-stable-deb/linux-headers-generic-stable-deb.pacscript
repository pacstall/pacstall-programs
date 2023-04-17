name="linux-headers-generic-stable-deb"
gives="linux-headers-6.2.11-060211-generic"
version="6.2.11"
buildver="6.2.11-060211.202304131639"
if [[ ${CARCH} == "arm64" ]]; then
  hash="a02b22383105478dd2083379cfbcc2af5fefa2b7733bb67fbcf0ad0c669c968b"
  arch=('arm64')
else
  hash="d6207d94546e635fddbc4b4c77086ea01a9f6e5dbb10d380f2bedfaa87669fd9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
