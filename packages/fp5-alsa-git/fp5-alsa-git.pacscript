pkgname="fp5-alsa-git"
gives="${pkgname%-git}"
arch=("all")
pkgver="0.0.1"
source=("${gives}::https://github.com/sc7280-mainline/alsa-ucm-conf.git")
pkgdesc="ALSA files for Fairphone 5"
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("alsa-ucm-conf")

package() {
  cd "${gives}"
  alsadir="usr/share/alsa/ucm2"
  mkdir -p "${pkgdir}/${alsadir}/conf.d/simple-card"
  mkdir -p "${pkgdir}/${alsadir}/conf.d/qcm6490"
  mkdir -p "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d"

  cp -r "ucm2/Fairphone" "${pkgdir}/${alsadir}/"
  for i in "qcm6490/fairphone-Fairphone5.conf" "qcm6490/Fairphone 5.conf" "simple-card/fp5.conf"; do
    ln -sf "/${alsadir}/Fairphone/fp5/fp5.conf" "${pkgdir}/${alsadir}/conf.d/${i}"
  done

  echo 'monitor.alsa.rules = [
  {
    matches = [
      {
        # Match all ALSA sources.
        node.name = "~alsa_input.*"
      }
      {
        # Match all ALSA sinks.
        node.name = "~alsa_output.*"
      }
    ]
    actions = {
      update-props = {
        audio.format         = "S16LE"
        audio.rate           = 48000
        api.alsa.period-size = 4096
        api.alsa.period-num  = 6
        api.alsa.headroom    = 512
      }
    }
  }
]' | tee "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/51-qcom.conf" > /dev/null
}
