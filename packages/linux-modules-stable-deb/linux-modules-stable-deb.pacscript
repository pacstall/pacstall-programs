name="linux-modules-stable-deb"
gives="linux-modules-6.3.3-060303-generic"
version="6.3.3"
buildver="6.3.3-060303.202305171336"
if [[ ${CARCH} == "arm64" ]]; then
  hash="6accf57d072bf5e58f8910fc4c0dab5016fe7279bd78f0e9543dfbd3206ed7d5"
  arch=('arm64')
else
  hash="758d672f3bd251f9109ee398a474d2692fc898144091c42b80f6ec5b53347962"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
