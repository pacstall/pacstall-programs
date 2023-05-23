name="linux-headers-generic-deb"
gives="linux-headers-6.4.0-060400rc3-generic"
version="6.4-rc3"
buildver="6.4.0-060400rc3.202305212230"
if [[ ${CARCH} == "arm64" ]]; then
  hash="0c471924ccf6400703a6b836652d821ab0caf0dee86bff2475553d0d5fa0d464"
  arch=('arm64')
else
  hash="31585a5d02ee16c8029b216f7116ab4f8f020fe8a0cf04c254bdb2eef8401dc3"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
