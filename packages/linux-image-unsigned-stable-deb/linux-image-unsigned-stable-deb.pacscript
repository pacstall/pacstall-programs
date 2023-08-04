name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.4.8-060408-generic"
version="6.4.8"
buildver="6.4.8-060408.202308041557"
if [[ ${CARCH} == "arm64" ]]; then
  hash="c6819c8a1a44ae06e8d9412238634f3c8b02a103ff7fe8ac0ba05663471e88d0"
  arch=('arm64')
else
  hash="5889d24fbcf7a501e30c283ccdc665e1048823794a96f8256e68e8bbfe8f6ac7"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
