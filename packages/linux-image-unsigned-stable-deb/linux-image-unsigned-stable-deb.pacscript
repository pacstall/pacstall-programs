name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.3.9-060309-generic"
version="6.3.9"
buildver="6.3.9-060309.202306271338"
if [[ ${CARCH} == "arm64" ]]; then
  hash="608d1d6f1288dfd4043a722e9683860df236a99efbd3785bb914e17f73fc2771"
  arch=('arm64')
else
  hash="333b0bda3cc310f13d65d2b6db318465ca435b9b4c13eaad47d2bdb751b60a03"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
