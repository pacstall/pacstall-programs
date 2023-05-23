name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.4.0-060400rc3-generic"
version="6.4-rc3"
buildver="6.4.0-060400rc3.202305212230"
if [[ ${CARCH} == "arm64" ]]; then
  hash="eccdc4ca0cecb89bf6449c60854423c3832f457b090dc95f75b0ac848d9e7c9c"
  arch=('arm64')
else
  hash="92d802b79d367692b55b50f7b6abb93a5c1828e212f2a32bcd4e002dd795ec5d"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
