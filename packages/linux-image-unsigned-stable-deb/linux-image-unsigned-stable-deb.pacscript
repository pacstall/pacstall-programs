name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.3.4-060304-generic"
version="6.3.4"
buildver="6.3.4-060304.202305241735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="9bfce7359cb5477091cf79c604aec36c0bc52f9c1526605689c3dfbceee250cc"
  arch=('arm64')
else
  hash="1ec17fd573ce694f2cedd9b6da705abf75301ad5122663227ed2ef093d4cfb32"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
