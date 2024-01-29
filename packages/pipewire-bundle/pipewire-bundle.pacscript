name="pipewire-bundle"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
makedepends=("libconfig++9v5" "libffado2" "libopenfec1" "libroc0.3" "libxml++2.6-2v5" "libcanberra-pulse")
pkgdesc="Pipewire bundled with its necessary packages, from Debian source"
maintainer="Oren Klopfer <oren@taumoda.com>"
compatible=("ubuntu:devel" "ubuntu:noble")
pkgver="1.0.1-2"
base_url="http://ftp.debian.org/debian/pool/main/p/pipewire"
bundle_packages=(
  "libspa-0.2-modules_${pkgver}_${CARCH}"
  "libspa-0.2-bluetooth_${pkgver}_${CARCH}"
  "libpipewire-0.3-common_${pkgver}_all"
  "libpipewire-0.3-0_${pkgver}_${CARCH}"
  "libpipewire-0.3-modules_${pkgver}_${CARCH}"
  "libpipewire-0.3-modules-x11_${pkgver}_${CARCH}"
  "pipewire-bin_${pkgver}_${CARCH}"
  "pipewire_${pkgver}_${CARCH}"
  "pipewire-audio_${pkgver}_all"
  "pipewire-alsa_${pkgver}_${CARCH}"
  "pipewire-jack_${pkgver}_${CARCH}"
  "pipewire-pulse_${pkgver}_${CARCH}"
  "pipewire-v4l2_${pkgver}_${CARCH}"
  "gstreamer1.0-pipewire_${pkgver}_${CARCH}"
)
regnames=()
for package in "${bundle_packages[@]}"; do
  regnames+=("${package%%_*}")
done

build() {
  sudo mkdir -p "${pkgdir}/etc/apt/preferences.d"
  for package in "${regnames[@]}"; do
    sudo touch "${pkgdir}/etc/apt/preferences.d/${package}.pref"
    echo "Package: ${package}
Pin: release o=Ubuntu
Pin-Priority: 1" | sudo tee "${pkgdir}/etc/apt/preferences.d/${package}.pref" > /dev/null
  done
}

prepare() {
  local idx=0
  for package in "${bundle_packages[@]}"; do
    wget -q "${base_url}/${package}.deb" -O "${idx}_${name}.deb"
    ((idx++))
  done
}

package() {
  sudo apt-get install --allow-downgrades -f ./[0-9]*"${name}".deb -y
}

post_remove() {
  for package in "${regnames[@]}"; do
    sudo apt-mark auto "${package}" > /dev/null
  done
}
