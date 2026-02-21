pkgname="libspa-codec-bluez5-aac-bin"
gives="libspa-codec-bluez5-aac"
pkgver="0.3.65-4~glasgall1"
source=("@${pkgname}~${pkgver}::https://github.com/Zahrun/libspa-0.2-bluetooth/raw/main/libspa-codec-bluez5-aac_${pkgver}_amd64.tar.xz")
pkgdesc="Adds AAC bluetooth codec to pipewire"
sha256sums=("9a235d1b5d8bb52302f9c8159da828ca7c8de15614233967d484d92cba4e56c2")
arch=('amd64')
maintainer=("Zahrun <zahrunAtmurenaDotio>")
depends=("libspa-0.2-bluetooth")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 libspa-codec-bluez5-aac.so -t "${pkgdir}/usr/lib/x86_64-linux-gnu/spa-0.2/bluez5/"
}
