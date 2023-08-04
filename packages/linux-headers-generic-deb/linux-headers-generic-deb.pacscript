name="linux-headers-generic-deb"
gives="linux-headers-6.5.0-060500rc4-generic"
version="6.5-rc4"
buildver="6.5.0-060500rc4.202308041735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="2fac0ffade44200776fe0784b279d3acdeab1dd76f77aaf940cb050b79b27312"
  arch=('arm64')
else
  hash="9be8ea12ae0d30ec6c1f841025b77508b759ceeb90babb13f800f450b25c1dcb"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline-headers")
