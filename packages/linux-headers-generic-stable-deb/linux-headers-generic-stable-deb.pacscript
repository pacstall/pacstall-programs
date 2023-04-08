name="linux-headers-generic-stable-deb"
gives="linux-headers-6.2.10-060210-generic"
version="6.2.10"
buildver="6.2.10-060210.202304061139"
if [[ ${CARCH} == "arm64" ]]; then
   hash="2eff83932f9f7fac2373df8b05fd76be0eb5bca24af5db1b762ae8e7801b6f2b"
   arch=('arm64');
 else
   hash="1a2b1dfdd92e8d756cd68388edffeb85d381f8c5722d0ede2fa9115c10d8bcee"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
