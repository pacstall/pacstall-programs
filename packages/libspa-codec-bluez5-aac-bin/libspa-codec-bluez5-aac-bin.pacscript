name="libspa-codec-bluez5-aac-bin"
gives="libspa-codec-bluez5-aac"
version="0.3.65-4~glasgall1"
url="https://github.com/Zahrun/libspa-0.2-bluetooth/raw/main/libspa-0.2-bluetooth_${version}_amd64.deb."
description="Adds AAC bluetooth codec to pipewire"
hash="381a96c18bc273f4e2fa504e1c8980b28dd2cf0bd5fdfe2b5ee6ee4bb69e459c"
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
depends=("libspa-0.2-bluetooth")

prepare() {
  dpkg-deb -x libspa-0.2-bluetooth_0.3.65-4~glasgall1_amd64.deb. .
}

install() {
  sudo install -Dm644 ./usr/lib/x86_64-linux-gnu/spa-0.2/bluez5/libspa-codec-bluez5-aac.so "${pkgdir}/usr/lib/x86_64-linux-gnu/spa-0.2/bluez5/libspa-codec-bluez5-aac.so"
}
