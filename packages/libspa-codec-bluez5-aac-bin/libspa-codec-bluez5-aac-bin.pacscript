pkgname="libspa-codec-bluez5-aac-bin"
gives="libspa-codec-bluez5-aac"
pkgver="1.2.4-1ubuntu2~glasgall1"
arch=("amd64")
source_amd64="archive::https://launchpad.net/~aglasgall/+archive/ubuntu/pipewire-extra-bt-codecs/+files/libspa-0.2-bluetooth_${pkgver}_amd64.deb/" # FIXME: We add a trailing slash to trick it into not installing.
sha256sums_amd64="9a9b0411790ee991ba1afb7756d579f2005ca94d01cf71393f2f724184119a87"
noextract=("archive")
pkgdesc="Adds AAC bluetooth codec to pipewire"
maintainer=("Zahrun <Zahrun@github.com>")
depends=("libspa-0.2-bluetooth")

prepare() {
  dpkg-deb -R "archive" "${pkgname}-${pkgver}"
  find .
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/usr/lib/${AARCH}-linux-gnu/spa-0.2/bluez5/libspa-codec-bluez5-aac.so" -t "${pkgdir}/usr/lib/${AARCH}-linux-gnu/spa-0.2/bluez5/"
}
