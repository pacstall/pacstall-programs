pkgname="rhino-pine-lomiri-core"
source=("https://raw.githubusercontent.com/oklopfer/debs/refs/heads/master/empty")
pacdeps=("ubxi-lomiri-desktop" "u-boot-mobian-deb" "mobile-usb-networking-deb")
depends=("initramfs-tools")
if [[ -f /usr/bin/enable-modem ]]; then
  depends+=("eg25-manager | ofono-scripts" "modemmanager | ofono" "gnome-calls" "gnome-contacts" "chatty" "callaudiod" "feedbackd" "gpsd")
fi
pkgdesc="Transitional package to provide all core Rhino Linux Mobile (Lomiri) software"
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=("ubuntu:devel" "ubuntu:questing" "ubuntu:resolute")
priority="essential"
arch=("all")
pkgver="2025.3"

package() {
  echo 'monitor.alsa.rules = [
    {
      matches = [
        {
          device.name = "alsa_card.platform-hdmi-sound"
        }
      ]
      actions = {
        update-props = {
          device.disabled = true
        }
      }
    }
  ]' | tee "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/alsa-disable-hdmi.conf" > /dev/null
}

post_install() {
  if [[ -f /usr/bin/enable-modem ]]; then
    echo 'START_DAEMON="true"
USBAUTO="true"
DEVICES="/dev/EG25.NMEA"
GPSD_OPTIONS="-D3"' | sudo tee /etc/default/gpsd > /dev/null
    sudo systemctl enable gpsd
  else
    echo 'sensor:modalias:*sc7a20:*
  ACCEL_MOUNT_MATRIX=1, 0, 0; 0, 0, 1; 0, 1, 0' | sudo tee /etc/udev/hwdb.d/61-sensor-local.hwdb > /dev/null
    sudo systemd-hwdb update
  fi
}
