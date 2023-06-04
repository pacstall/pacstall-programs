name="linux-headers-generic-deb"
gives="linux-headers-6.4.0-060400rc5-generic"
version="6.4-rc5"
buildver="6.4.0-060400rc5.202306041930"
if [[ ${CARCH} == "arm64" ]]; then
  hash="45d20be2c8304309b0ecd51f79fddb12b72410577e58e5a8a950443c08d891c0"
  arch=('arm64')
else
  hash="18d7dc49897f30148f0b36fd4123ee53d0d331d809ad3a3bcb08e4d9138255d7"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
