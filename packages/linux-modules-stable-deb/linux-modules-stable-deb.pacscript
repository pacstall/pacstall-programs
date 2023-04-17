name="linux-modules-stable-deb"
gives="linux-modules-6.2.11-060211-generic"
version="6.2.11"
buildver="6.2.11-060211.202304131639"
if [[ ${CARCH} == "arm64" ]]; then
  hash="508ff6ecf869617bf279c97b304a91953bca0fc26492b01ad271def68ebe97f8"
  arch=('arm64')
else
  hash="82891dd437fce24d9b11c51728e6ae0f26162676b63783860d6c769bf6907849"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
