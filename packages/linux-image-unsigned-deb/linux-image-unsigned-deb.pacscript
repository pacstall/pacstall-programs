name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.4.0-060400-generic"
version="6.4"
buildver="6.4.0-060400.202306271339"
if [[ ${CARCH} == "arm64" ]]; then
  hash="26868d6d0d729f952823859926ef2644ac01dd8dcbb5501e61f07a4ec1362e06"
  arch=('arm64')
else
  hash="4092881b02fa9c245ac9ced89a7d680ff173efcd0f32c0e7e177fdb4dcd07511"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
