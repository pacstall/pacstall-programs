pkgname="fp5-deviceinfo"
arch=("any")
pkgver="0.0.1"
source=("https://raw.githubusercontent.com/oklopfer/debs/refs/heads/master/empty")
pkgdesc="DeviceInfo data for Fairphone 5"
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("deviceinfo-tools" "libdeviceinfo0")

package() {
  mkdir -p "${pkgdir}/etc/deviceinfo/devices"
  echo 'FP5:
  Names:
    - fp5
    - FP5
    - Fairphone 5
  PrettyName: Fairphone 5
  DeviceType: phone
  GridUnit: 14
  SupportedOrientations:
    - Portrait
    - Landscape
    - InvertedPortrait
    - InvertedLandscape
  MirAndroidPlatformServerBackpressure:
    - false
  MirAndroidPlatformServerPartialUpdates:
    - true
  MirAndroidPlatformServerEglSync:
    - false
  MirAndroidPlatformClientEglFlush:
    - "!/usr/bin/unity8,!/usr/bin/lomiri,all"

  FlashlightSysfsPath: "/sys/class/leds/led:torch_0/brightness"
  FlashlightSwitchPath: "/sys/class/leds/led:switch_0/brightness"
  DoubleTapToWake: "/sys/devices/platform/goodix_ts.0/gesture/double_en|1|0"
  OfonoPlugin: binder
  OfonoImplementsIms: true
  FilesystemEncryption: true
  RepowerdQtiPerfBooster: true
  CollapsedPanelHeight: 105
  DisplayCutoutsCollapsed:
    - 0 0 50 105
    - 566 0 91 105
    - 1174 0 50 105
  DisplayCutoutsExpanded:
    - 0 0 30 168
    - 565 0 91 168
    - 1194 0 30 168' | tee "${pkgdir}/etc/deviceinfo/devices/fairphone5.yaml" > /dev/null
}
