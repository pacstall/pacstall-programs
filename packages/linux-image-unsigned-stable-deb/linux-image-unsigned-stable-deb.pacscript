name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.3.3-060303-generic"
version="6.3.3"
buildver="6.3.3-060303.202305171336"
if [[ ${CARCH} == "arm64" ]]; then
  hash="ef4fc97bf96cfcea90ec5ca7c48d8c35b3fb594a7689ed8961992d965f0eff5f"
  arch=('arm64')
else
  hash="4c64c4e1dacca013ae817843559327ee3e0aec2a4e4aa057568ae379b8e617ed"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
