name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.4.6-060406-generic"
version="6.4.6"
buildver="6.4.6-060406.202307241739"
if [[ ${CARCH} == "arm64" ]]; then
  hash="0fb2b418bd845a30628641180cffb94a2ac9c96e76431fa2f96223201d7b0c35"
  arch=('arm64')
else
  hash="aa27531d02bf2dacd3f54091769d9d4e5ca5214b3e3dc9230e32593f775efa30"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
