name="linux-modules-stable-deb"
gives="linux-modules-6.2.12-060212-generic"
version="6.2.12"
buildver="6.2.12-060212.202304201141"
if [[ ${CARCH} == "arm64" ]]; then
  hash="265418b06512bcf285501506ae57ac2a250e83a0afd480fd71c7b9b611b12b0f"
  arch=('arm64')
else
  hash="eab87952b1c3d283fd1127700519e79302fa42abf8a8d742a6d70df6aca6a829"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
