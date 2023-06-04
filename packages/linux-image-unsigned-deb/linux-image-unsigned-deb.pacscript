name="linux-image-unsigned-deb"
gives="linux-image-unsigned-6.4.0-060400rc5-generic"
version="6.4-rc5"
buildver="6.4.0-060400rc5.202306041930"
if [[ ${CARCH} == "arm64" ]]; then
  hash="54a609581d76361c2539cd1c0102e5cc3ef1561370952bc0aefc91157c60998e"
  arch=('arm64')
else
  hash="6a319bd35e4358df6763c3b52f8cff2b8a356e81ed6c69bbb25c62c38388d73e"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
