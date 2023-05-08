name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.3.1-060301-generic"
version="6.3.1"
buildver="6.3.1-060301.202304302031"
if [[ ${CARCH} == "arm64" ]]; then
  hash="4dd7d65f02dae1aca4dc439b59701341e1930fe7b9fd20f32c6ac596afac66ff"
  arch=('arm64')
else
  hash="686229f534d26f237fde0a197bf4f9172e1ec6aa2a8e74df32a947d4249feaed"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
