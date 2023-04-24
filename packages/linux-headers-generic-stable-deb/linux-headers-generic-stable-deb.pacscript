name="linux-headers-generic-stable-deb"
gives="linux-headers-6.2.12-060212-generic"
version="6.2.12"
buildver="6.2.12-060212.202304201141"
if [[ ${CARCH} == "arm64" ]]; then
  hash="38d09b5dca74edc91817942f7705bd1031fb214fb4026c1f3e0482d3b200dc18"
  arch=('arm64')
else
  hash="3d8a51d1188d4420e1351696db4d9e26660531c0bb75c74458975af7a4635c4a"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
