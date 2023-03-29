name="linux-modules-stable-deb"
gives="linux-modules-6.2.8-060208-generic"
buildver="6.2.8-060208.202303220943"
if [[ $CARCH == arm64 ]]; then
   hash="f059a3420b6d07dd07ca4355be1418c1f04e2a63a707b4591ec980034c5f0982"
   arch=('arm64');
 else
   hash="0a6c23f42433f7d7caf6cb82d619b964c04ecf42ae0c01660096da9ac4916b20"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
