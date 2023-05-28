name="linux-modules-stable-deb"
gives="linux-modules-6.3.4-060304-generic"
version="6.3.4"
buildver="6.3.4-060304.202305241735"
if [[ ${CARCH} == "arm64" ]]; then
  hash="20246252f0fe03f39aecbba0e0e55b2749ba4ff14094a9b535fb4162b5c36502"
  arch=('arm64')
else
  hash="d921608a09d60dfb2e33a1e2eaf232c5a61228d5b65e8e09ff7ad601e2615139"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
