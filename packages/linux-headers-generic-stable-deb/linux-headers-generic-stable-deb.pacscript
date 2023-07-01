name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.0-060400-generic"
version="6.4"
buildver="6.4.0-060400.202306271339"
if [[ ${CARCH} == "arm64" ]]; then
  hash="902549d797b8049aa54d83c864be65de1f70934df032fe8c62629af4d33881e0"
  arch=('arm64')
else
  hash="a8e0c1ae8776fccd010a817b319a5922332a0f29dcd50303826cddf9a6e4a061"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
