pkgname="couture"
_name="Couture"
arch=("all")
pkgver="1.6"
source=("@${pkgname}~${pkgver}::https://www.auburnsounds.com/downloads/${_name}-FREE-${pkgver}.zip")
pkgdesc="Couture gives you exquisite control over your dynamics, and particularly attacks."
sha256sums=("5cebcd1358f450a0b7c7003444c3febbc8764be8d401ead2a3e07cab232aa14e")
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
