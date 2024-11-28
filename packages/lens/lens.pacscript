pkgname="lens"
_name="Lens"
arch=("all")
pkgver="1.0.2"
source=("@${pkgname}~${pkgver}::https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="LENS is a spectral dynamics processor with unbelievable punch and clarity."
sha256sums=("bd7c1b6ba8f7ad8ac2ee674f881e06f9650cf863ad7ee79d22e30b4d853dad19")
maintainer=("echometerain <echometer@disroot.org>")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/lv2"
  mv "./Linux/Linux-64b-LV2-FREE" "${pkgdir}/usr/lib/lv2/Auburn Sounds ${_name}.lv2"
  mkdir -p "${pkgdir}/usr/lib/vst"
  mv "./Linux/Linux-64b-VST2-FREE" "${pkgdir}/usr/lib/vst/Auburn Sounds ${_name}.VST2"
  mkdir -p "${pkgdir}/usr/lib/vst3"
  mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds ${_name}.vst3" "${pkgdir}/usr/lib/vst3/Auburn Sounds ${_name}.vst3"
}
