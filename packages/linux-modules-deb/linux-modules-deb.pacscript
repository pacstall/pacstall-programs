name="linux-modules-deb"
gives="linux-modules-6.4.0-060400rc5-generic"
version="6.4-rc5"
buildver="6.4.0-060400rc5.202306041930"
if [[ ${CARCH} == "arm64" ]]; then
  hash="a03a7b29f526760ca8763c1598e916db4e04486fc1e5adea7387fd8655bd16e7"
  arch=('arm64')
else
  hash="fc8cf921ef79d96c8391a189fcf1a2177a183f6806b998ac41b478f43e9a7027"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
