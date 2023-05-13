name="linux-modules-stable-deb"
gives="linux-modules-6.3.2-060302-generic"
version="6.3.2"
buildver="6.3.2-060302.202305111150"
if [[ ${CARCH} == "arm64" ]]; then
  hash="44cb563ef1545809a3f10f8398b38fc486d815c23de5294f350f764ffb16df6e"
  arch=('arm64')
else
  hash="a6863cbf9e69949a992d73c413623039247c5ade8ea2499e52131aa9de42cf85"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
