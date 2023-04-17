name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.2.11-060211-generic"
version="6.2.11"
buildver="6.2.11-060211.202304131639"
if [[ ${CARCH} == "arm64" ]]; then
  hash="9d15931781b6176d48f9519efc7877673226fbe89a9ecae3e5d1568437e83d6d"
  arch=('arm64')
else
  hash="c15e849a4f26efb7afb4a2e79719d8c9962849ff12eb2b484a7785296f63faf7"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
