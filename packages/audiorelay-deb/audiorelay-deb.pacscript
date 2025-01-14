pkgname="audiorelay-deb"
repology=("project: audiorelay")
arch=("amd64")
pkgver="0.27.5"
url='https://audiorelay.net/'
source=("https://dl.audiorelay.net/setups/linux/audiorelay-${pkgver}.deb")
sha256sums=("b4b00d3ba21718df61021a67cb7b3eaab5dfaaa779bef7e3247054a079cd3dee")
gives="audiorelay"
pkgdesc="Turn your phone into a microphone or speakers for PC"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
compatible=(
  "ubuntu:focal"
  "ubuntu:jammy"
)
