pkgname="panagement"
_name="Panagement"
arch=("any")
pkgver="2.4"
source=("@${pkgname}~${pkgver}::https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Panagement is the spatialization laboratory that has found its way to thousands of studios around the world. Panagement gives you raw power over your stereo tracks."
sha256sums=("d8544b8941fcc9049b6743c99799b380bd636c6f49b10ed08204719de866f1a1")
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
