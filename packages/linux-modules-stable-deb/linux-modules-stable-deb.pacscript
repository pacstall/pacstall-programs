name="linux-modules-stable-deb"
gives="linux-modules-6.2.10-060210-generic"
version="6.2.10"
buildver="6.2.10-060210.202304061139"
if [[ ${CARCH} == "arm64" ]]; then
   hash="631c6754ca07769c2da7a2f80fe3ca20916c891bdf2bd77b853bd679c38fc9ac"
   arch=('arm64');
 else
   hash="b66156085c8a7cf01bb02b1f133e2361c037941b7eb1029c34d3431953e2b832"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Linux Modules)"
maintainer="Oren Klopfer <oren@taumoda.com>"
