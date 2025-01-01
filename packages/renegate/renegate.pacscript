pkgname="renegate"
_name="Renegate"
arch=("any")
pkgver="1.2"
source=("@${pkgname}~${pkgver}::https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Renegate is simply just a full-band Gate plug-in. It has an always smooth, natural sound, and is quick to operate."
sha256sums=("d7119fddfa44751a5c346e345de7c494a0ea11fcbae2aba65f1b66a8f414ecef")
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
