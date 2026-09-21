pkgname="fp5-firmware-git"
gives="${pkgname%-git}"
arch=("any")
pkgver="0.0.1"
source=("${gives}::https://github.com/FairBlobs/FP5-firmware.git")
pkgdesc="Firmware for Fairphone 5"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=("pil-squasher-git")
depends=("droid-juicer" "hexagonrpcd")

build() {
  cd "${gives}"
  echo "Squashing firmware files..."
  find . -name "*.mdt" -type f | while read -r mdtfile; do
    echo "Processing: ${mdtfile}"
    pil-squasher "${PWD}/${mdtfile%.mdt}.mbn" "${PWD}/${mdtfile}"
  done
}

package() {
  cd "${gives}"
  firmdir="${pkgdir}/usr/lib/firmware/qcom/qcm6490/fairphone5"
  mkdir -p "${firmdir}"
  mkdir -p "${pkgdir}/usr/lib/firmware/qca"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/qcom/qcm6490/Fairphone/fp5"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  # the ones below are intentionally empty
  mkdir -p "${pkgdir}/var/lib/droid-juicer/sensors"
  mkdir -p "${pkgdir}/mnt/vendor/persist/sensors/registry"

  # compiled files
  install -Dm644 -t "${firmdir}" \
    a660_zap.mbn \
    adsp.mbn \
    cdsp.mbn \
    modem.mbn \
    wpss.mbn \
    adspr.jsn \
    adsps.jsn \
    adspua.jsn \
    battmgr.jsn \
    cdspr.jsn \
    modemr.jsn

  # Renamed files
  install -Dm644 yupik_ipa_fws.mbn "${firmdir}/ipa_fws.mbn"
  install -Dm644 aw882xx_acf.bin "${firmdir}/aw88261_acf.bin"
  install -Dm644 vpu20_1v.mbn "${firmdir}/venus.mbn"

  # Bluetooth
  install -Dm644 -t "${pkgdir}/usr/lib/firmware/qca" msbtfw11.mbn msnv11.bin

  # folders
  cp -r modem_pr "${firmdir}"
  cp -r hexagonfs/* "${pkgdir}/usr/share/qcom/qcm6490/Fairphone/fp5"

  # udev rules
  echo 'SUBSYSTEM=="misc", KERNEL=="fastrpc-adsp*", ENV{IIO_SENSOR_PROXY_TYPE}+="ssc-accel ssc-proximity"
SUBSYSTEM=="misc", KERNEL=="fastrpc-*", ENV{ACCEL_MOUNT_MATRIX}+="-1, 0, 0; 0, -1, 0; 0, 0, -1"' \
| tee "${pkgdir}/etc/udev/rules.d/99-fp5-sensors.rules" > /dev/null

  # systemd service
  echo '[Unit]
Description=Qualcomm ADSP FastRPC server (sensorspd)
After=local-fs.target

[Service]
ExecStart=/bin/hexagonrpcd -f /dev/fastrpc-adsp -d adsp -s -R /usr/share/qcom/qcm6490/Fairphone/fp5
Restart=on-failure
RestartSec=3

[Install]
WantedBy=multi-user.target' | tee "${pkgdir}/usr/lib/systemd/system/hexagonrpcd-adsp-sensorspd.service" > /dev/null
}

post_install() {
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl enable hexagonrpcd-adsp-sensorspd.service
  fi
  if [[ -f /bin/udevadm ]]; then
    sudo udevadm control --reload-rules
    sudo udevadm trigger
  fi
}

post_remove() {
  if [[ -f /etc/systemd/system/multi-user.target.wants/hexagonrpcd-adsp-sensorspd.service ]]; then
    sudo rm -f /etc/systemd/system/multi-user.target.wants/hexagonrpcd-adsp-sensorspd.service \
    && echo "Removed /etc/systemd/system/multi-user.target.wants/hexagonrpcd-adsp-sensorspd.service."
  fi
}
