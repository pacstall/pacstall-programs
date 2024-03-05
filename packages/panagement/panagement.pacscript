name="panagement"
_name="Panagement"
pkgver="2.4"
source=("https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Panagement is the spatialization laboratory that has found its way to thousands of studios around the world. Panagement gives you raw power over your stereo tracks."
hash=("d8544b8941fcc9049b6743c99799b380bd636c6f49b10ed08204719de866f1a1")
maintainer="echometerain <echometer@disroot.org>"

package() {
  sudo mkdir -p "${pkgdir}/usr/lib/lv2"
  sudo mv "./Linux/Linux-64b-LV2-FREE" "${pkgdir}/usr/lib/lv2/Auburn Sounds ${_name} 2.lv2"
  sudo mkdir -p "${pkgdir}/usr/lib/vst"
  sudo mv "./Linux/Linux-64b-VST2-FREE" "${pkgdir}/usr/lib/vst/Auburn Sounds ${_name} 2.VST2"
  sudo mkdir -p "${pkgdir}/usr/lib/vst3"
  sudo mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds ${_name} 2.vst3" "${pkgdir}/usr/lib/vst3/Auburn Sounds ${_name} 2.vst3"
}
