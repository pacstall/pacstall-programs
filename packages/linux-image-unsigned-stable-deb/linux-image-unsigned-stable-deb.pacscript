name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.4.3-060403-generic"
version="6.4.3"
buildver="6.4.3-060403.202307110536"
if [[ ${CARCH} == "arm64" ]]; then
  hash="7c536d1f9d7e4a126d3e8b6475eb042f77ca67f948a936df5fc69241c0c74e3d"
  arch=('arm64')
else
  hash="897c39be2a898c71c6a367d22951a19ca7cf4597a763f2e0a12da6f20db04ca9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
