name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.2.12-060212-generic"
version="6.2.12"
buildver="6.2.12-060212.202304201141"
if [[ ${CARCH} == "arm64" ]]; then
  hash="8e6b84efbe0b03cd04c7848ee8bc229a1f2f8238d59f30591290dd815cb04134"
  arch=('arm64')
else
  hash="e91abb4396bb00f8147e210018e013a004586e46fb16a13b63ad2b2faae47a61"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
