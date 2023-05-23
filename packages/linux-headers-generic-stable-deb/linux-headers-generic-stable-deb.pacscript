name="linux-headers-generic-stable-deb"
gives="linux-headers-6.3.3-060303-generic"
version="6.3.3"
buildver="6.3.3-060303.202305171336"
if [[ ${CARCH} == "arm64" ]]; then
  hash="886bcc09ac31b9b6c56d469d220e89277ddb7c5a11eacd546693ced4ed54bbe2"
  arch=('arm64')
else
  hash="a02149d83da28e47b534236cf91814783cd675ef922dcebfd1eb0ffe9d1564c9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
