pkgname="ubxi-lomiri-desktop"
arch=("amd64" "arm64" "riscv64")
pkgver="0.0.1"
source=("https://raw.githubusercontent.com/oklopfer/debs/refs/heads/master/empty")
depends=(
  "alsa-ucm-conf" "ciborium" "contactsd" "deviceinfo-extras" "deviceinfo-tools" "iio-sensor-proxy"
  "morph-browser" "lomiri-desktop-session" "lomiri-download-manager" "lomiri-greeter" "lomiri-indicator-location"
  "lomiri-indicator-transfer-download-manager" "lomiri-polkit-agent" "libqt5multimedia5-plugins"
  "lomiri-location-service-bin" "qml-module-lomiri-notifications" "repowerd" "usb-modeswitch" "xwayland"
  "mesa-va-drivers" "mesa-vdpau-drivers" "mesa-vulkan-drivers" "mir-graphics-drivers-desktop"
  "lomiri-addressbook-app" "lomiri-calculator-app" "lomiri-calendar-app" "lomiri-camera-app" "lomiri-clock-app"
  "lomiri-cloudsync-app" "lomiri-dekko-app" "lomiri-docviewer-app" "lomiri-filemanager-app" "lomiri-gallery-app"
  "lomiri-teleports-app" "lomiri-tfamanager-app" "lomiri-weather-app" "lomiri-mediaplayer-app" "lomiri-music-app"
  "lomiri-keyboard-dutch" "lomiri-keyboard-emoji" "lomiri-keyboard-english" "lomiri-keyboard-french"
  "lomiri-keyboard-german" "lomiri-keyboard-italian" "lomiri-keyboard-portuguese" "lomiri-keyboard-russian"
  "lomiri-keyboard-spanish" "lomiri-keyboard-swedish"
)
depends_amd64=("mir-graphics-drivers-nvidia")
pacdeps=("rhino-ubxi-core")
priority='required'
pkgdesc="UBXI Lomiri Desktop"
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=('ubuntu:*')
