name="linux-headers-generic-stable-deb"
gives="linux-headers-6.4.6-060406-generic"
version="6.4.6"
buildver="6.4.6-060406.202307241739"
if [[ ${CARCH} == "arm64" ]]; then
  hash="66bdff83865dc959cff612b94a1d90ca29d5232771b243677035509fac7dfbc9"
  arch=('arm64')
else
  hash="52ee6ee1c121b8823a5f5256e04eeb600258e93d732b888fb4da84ff0a7ff2a6"
  arch=('amd64')
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
