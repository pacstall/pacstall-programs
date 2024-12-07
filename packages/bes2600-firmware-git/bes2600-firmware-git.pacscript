pkgname="bes2600-firmware-git"
gives="bes2600-firmware"
arch=("all")
pkgver="0.0.1"
pkgrel="2"
pkgdesc="firmware files for BES2600 WLAN/BT combo chip and PineTab2 systemd files for controlling"
source=("https://gitlab.com/pine64-org/bes2600-firmware.git")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "bes2600-firmware"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"

  echo '#!/bin/sh
echo ifname:bt cmd:BT_ON > /dev/bes2600
rfkill unblock bluetooth
hciattach -s 1500000 /dev/ttyS1 any 1500000 flow nosleep
hciconfig hci0 up' | tee "${pkgdir}/usr/bin/pt2-bt.sh" > /dev/null

  chmod +x "${pkgdir}/usr/bin/pt2-bt.sh"

  echo "[Unit]
Description=Turn on PineTab2 bluetooth

[Service]
Type=forking
StandardOutput=journal
ExecStart=bash -c 'if [[ -f /etc/modules-load.d/bes2600.conf ]]; then /usr/bin/pt2-bt.sh; fi'
Restart=on-failure

[Install]
WantedBy=multi-user.target" | tee "${pkgdir}/usr/lib/systemd/system/pinetab2-bluetooth.service" > /dev/null

  echo "[Unit]
Description=Disable PineTab2 experimental WiFi modules

[Service]
Type=oneshot
ExecStart=bash -c 'if [[ -f /etc/modules-load.d/bes2600.conf ]]; then rm /etc/modules-load.d/bes2600.conf; fi'" | tee "${pkgdir}/usr/lib/systemd/system/pinetab2-wifi-disable.service" > /dev/null

  echo "[Unit]
Description=Enable PineTab2 experimental WiFi modules

[Service]
Type=oneshot
ExecStart=bash -c 'if ! [[ -f /etc/modules-load.d/bes2600.conf ]]; then echo bes2600 >> /etc/modules-load.d/bes2600.conf; fi'" | tee "${pkgdir}/usr/lib/systemd/system/pinetab2-wifi-enable.service" > /dev/null
}

package() {
  cd "bes2600-firmware"
  mkdir -p "${pkgdir}/usr/lib/firmware"
  cp -r firmware/bes2600 "${pkgdir}/usr/lib/firmware"
}

post_install() {
  if [[ -f /bin/systemctl ]]; then
    sudo systemctl enable pinetab2-bluetooth.service
  fi
}

post_remove() {
  if [[ -f /bin/systemctl ]]; then
    sudo rm /etc/systemd/system/multi-user.target.wants/pinetab2-bluetooth.service && echo "Removed /etc/systemd/system/multi-user.target.wants/pinetab2-bluetooth.service."
  fi
}
