name="couture"
_name="Couture"
pkgver="1.6"
source=("https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Couture gives you exquisite control over your dynamics, and particularly attacks."
hash=("5cebcd1358f450a0b7c7003444c3febbc8764be8d401ead2a3e07cab232aa14e")
maintainer="echometerain <echometer@disroot.org>"

package() {
  sudo mkdir -p "${pkgdir}/usr/lib/lv2"
  sudo mv "./Linux/Linux-64b-LV2-FREE" "${pkgdir}/usr/lib/lv2/Auburn Sounds ${_name}.lv2"
  sudo mkdir -p "${pkgdir}/usr/lib/vst"
  sudo mv "./Linux/Linux-64b-VST2-FREE" "${pkgdir}/usr/lib/vst/Auburn Sounds ${_name}.VST2"
  sudo mkdir -p "${pkgdir}/usr/lib/vst3"
  sudo mv "./Linux/Linux-64b-VST3-FREE/Auburn Sounds ${_name}.vst3" "${pkgdir}/usr/lib/vst3/Auburn Sounds ${_name}.vst3"
}
