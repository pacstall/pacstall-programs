pkgname="pipewire-deb-bundle"
pkgdesc="Audio and video processing engine multimedia server - Transitional meta-package"
arch=('amd64' 'arm64')
source=('https://github.com/oklopfer/debs/raw/master/empty.tar.xz')
pkgver="1.2.7-1+b1"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pacdeps=(
  "libwebrtc-audio-processing1-deb"
  "libspa-0.2-modules-deb"
  "libspa-0.2-bluetooth-deb"
  "libpipewire-0.3-common-deb"
  "libpipewire-0.3-0t64-deb"
  "libpipewire-0.3-modules-deb"
  "libpipewire-0.3-modules-x11-deb"
  "pipewire-bin-deb"
  "pipewire-deb"
  "pipewire-audio-deb"
  "pipewire-alsa-deb"
  "pipewire-jack-deb"
  "pipewire-pulse-deb"
  "pipewire-v4l2-deb"
  "gstreamer1.0-pipewire-deb"
)
