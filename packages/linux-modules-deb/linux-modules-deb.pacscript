name="linux-modules-deb"
gives="linux-modules-6.3.0-060300rc4-generic"
version="6.3-rc4"
buildver="6.3.0-060300rc4.202303262231"
if [[ ${CARCH} == "arm64" ]]; then
  hash="b42d4c192e57c10f6ab7332d292e89c5d30d88185c294aacfc9e62ef7104315f"
  arch=('arm64')
else
  hash="d17065e80dfaf818c61f63fbcdc833b51acd2755014553f5a06a8b66628d43b5"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="http.llamaz <chadano@llamawebdesign.co.uk>, Oren Klopfer <oren@taumoda.com>"
