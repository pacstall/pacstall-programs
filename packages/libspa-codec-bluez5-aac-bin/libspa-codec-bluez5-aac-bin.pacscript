name="libspa-codec-bluez5-aac-bin"
gives="libspa-codec-bluez5-aac"
pkgver="0.3.79-3~glasgall2"
url="https://github.com/Zahrun/libspa-0.2-bluetooth/raw/main/libspa-codec-bluez5-aac_${pkgver}_amd64.tar.gz"
pkgdesc="Adds AAC bluetooth codec to pipewire"
hash="b11c19b347b45fec5054f04d6d806d9d2d3371bd63331f04fc3758e0ac3ef129"
arch=('amd64')
maintainer="Zahrun <Zahrun@github.com>"
depends=("libspa-0.2-bluetooth")

package() {
  sudo install -Dm644 libspa-codec-bluez5-aac.so -t "${pkgdir}/usr/lib/x86_64-linux-gnu/spa-0.2/bluez5/"
}
