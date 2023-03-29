name="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.2.8-060208-generic"
version="6.2.8"
buildver="6.2.8-060208.202303220943"
if [[ $CARCH == arm64 ]]; then
   hash="660385f653490e92d0fc5be53c3908a0249b452797974dac782abc7d11a1775f"
   arch=('arm64');
 else
   hash="39e01d82b8b6e0a83722ea38689267f09cdfad9028c30705b8723d16d86da461"
   arch=('amd64');
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${version}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
description="Ubuntu Linux stable kernel (Unsigned image)"
maintainer="Oren Klopfer <oren@taumoda.com>"
