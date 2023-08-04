name="linux-modules-deb"
gives="linux-modules-6.5.0-060500rc4-generic"
version="6.5-rc4"
buildver="6.5.0-060500rc4.202308041735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="3eb3bd4f345c0e9ee6380d50de1957c597ee41412ac1f5e8a55aba650a3c9713"
  arch=('arm64')
else
  hash="e16291d6f9639292166d7c648ce9a007db3b518139d7a755d79b84968b4b81fc"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
