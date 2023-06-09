name="libspa-codec-bluez5-aac-bin"
gives="libspa-codec-bluez5-aac"
version="0.3.65-4~glasgall1"
url="https://github.com/Zahrun/pacstall-programs/raw/add/libspa-codec-bluez5-aac-bin/packages/libspa-codec-bluez5-aac-bin/libspa-codec-bluez5-aac.so"
description="Adds AAC bluetooth codec to pipewire"
hash="208d7b45b934db8f838b7ab2b34a37b5c07064d41af01e1321caede2d7d98364"
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
depends=("libspa-0.2-bluetooth")

install() {
  sudo install -Dm644 libspa-codec-bluez5-aac.so "${pkgdir}/usr/lib/x86_64-linux-gnu/spa-0.2/bluez5/libspa-codec-bluez5-aac.so"
}
