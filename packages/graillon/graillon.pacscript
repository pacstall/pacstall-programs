pkgname="graillon"
_name="Graillon"
arch=("any")
pkgver="2.6"
source=("@${pkgname}~${pkgver}::https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Graillon is a Vocal Live Changer that brings a world of possibilities right into your DAW"
sha256sums=("1a94c86c2d0da8a2830a6aa838e7d1f26454149a1a83592d500739bc5198659e")
maintainer=("echometerain <echometer@disroot.org>")

package() {
  cd "${pkgname}~${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/lv2"
  mv "./Linux/Linux-64b-LV2-FREE" "${pkgdir}/usr/lib/lv2/Auburn Sounds ${_name} 2.lv2"
  mkdir -p "${pkgdir}/usr/lib/vst"
  mv "./Linux/Linux-64b-VST2-FREE" "${pkgdir}/usr/lib/vst/Auburn Sounds ${_name} 2.VST2"
  mkdir -p "${pkgdir}/usr/lib/vst3"
  mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds ${_name} 2.vst3" "${pkgdir}/usr/lib/vst3/Auburn Sounds ${_name} 2.vst3"
}
