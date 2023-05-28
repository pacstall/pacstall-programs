name="linux-modules-deb"
gives="linux-modules-6.4.0-060400rc4-generic"
version="6.4-rc4"
buildver="6.4.0-060400rc4.202305281232"
if [[ ${CARCH} == "arm64" ]]; then
  hash="76e06dd46b644c0ec975d296bd9263488f73cc7585b9aadf0bcf8ffd15efd7b6"
  arch=('arm64')
else
  hash="3e5cbeea5ad4027484d4e14fc13f983f9a1189f624d1b8c5038e0deeb09a2bd9"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
