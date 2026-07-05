pkgname="ubxi-lomiri-desktop"
arch=("amd64" "arm64" "riscv64")
pkgver="0.0.1"
pkgrel="8"
source=("https://raw.githubusercontent.com/oklopfer/debs/refs/heads/master/empty")
lomiri_keyboards=(
  lomiri-keyboard-{arabic,azerbaijani,belarusian,bengali,bengali-avro,bengali-probhat,\
bosnian,bulgarian,catalan,chinese-chewing,chinese-pinyin,croatian,czech,danish,dutch,\
emoji,english,english-dvorak,esperanto,finnish,french,german,greek,hebrew,hungarian,\
icelandic,italian,japanese,korean,latvian,lithuanian,macedonian,norwegian-bokmal,persian,\
polish,portuguese,romanian,russian,scottish-gaelic,serbian,slovenian,spanish,swedish,\
swiss-french,thai,turkish,ukrainian}
)
depends=(
  "alsa-ucm-conf" "ciborium" "contactsd" "deviceinfo-extras" "deviceinfo-tools" "iio-sensor-proxy"
  "morph-browser" "lomiri-desktop-session" "lomiri-download-manager" "lomiri-greeter" "lomiri-indicator-location"
  "lomiri-indicator-transfer-download-manager" "lomiri-polkit-agent" "libqt5multimedia5-plugins"
  "lomiri-location-service-bin" "qml-module-lomiri-notifications" "repowerd" "usb-modeswitch" "xwayland"
  "mesa-libgallium" "mesa-vulkan-drivers" "mir-graphics-drivers-desktop" "qt6-wayland"
  "libqt6wlshellintegration6" "libqt6waylandcompositorwlshell6" "libqt6waylandcompositorxdgshell6"
  "liblomirisystemsettingsprivate0.0" "qml6-module-qtwayland-compositor" "qml-module-qtwayland-compositor"
  "lomiri-addressbook-app" "lomiri-calculator-app" "lomiri-calendar-app" "lomiri-camera-app" "lomiri-clock-app"
  "lomiri-cloudsync-app" "lomiri-dekko-app" "lomiri-docviewer-app" "lomiri-filemanager-app" "lomiri-gallery-app"
  "lomiri-teleports-app" "lomiri-tfamanager-app" "lomiri-weather-app" "lomiri-mediaplayer-app" "lomiri-music-app"
  "lomiri-system-settings-cellular" "lomiri-system-settings-phone" "${lomiri_keyboards[@]}"
)
depends_amd64=("mir-graphics-drivers-nvidia")
pacdeps=("rhino-ubxi-core" "rhino-lomiri-default-settings-git")
priority='required'
pkgdesc="UBXI Lomiri Desktop"
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=('ubuntu:*')
