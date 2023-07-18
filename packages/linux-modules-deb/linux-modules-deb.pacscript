name="linux-modules-deb"
gives="linux-modules-6.5.0-060500rc2-generic"
version="6.5-rc2"
buildver="6.5.0-060500rc2.202307162330"
if [[ ${CARCH} == "arm64" ]]; then
  hash="feb4740f06e861f08b0e30f0515c8a1a7d39a1cd80d10c638df265b4c657c824"
  arch=('arm64')
else
  hash="6eecffa23482a66a4ee1db9ba55234d0625428b0295dcddf3e1e5ae742789a8f"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux mainline kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
