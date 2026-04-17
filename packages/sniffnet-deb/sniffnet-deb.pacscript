pkgname="sniffnet-deb"
arch=("amd64" "arm64" "armhf")
gives="sniffnet"
pkgver="1.5.0"
replaces=("${gives}")
repology=("project: ${gives}")
depends=(
  libasound2
  libfontconfig1
  libpcap0.8
  libcap2-bin
)
url='https://sniffnet.net/'
pkgdesc="Sniffnet is a network monitoring tool to help you easily keep track of your Internet traffic."
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

source_amd64=("https://github.com/GyulyVGC/${gives}/releases/download/v${pkgver}/Sniffnet_LinuxDEB_amd64.deb")
sha256sums_amd64=("d3c802ee883a548d19279955c2e67132020694795127f8d2aecfbba305a70be5")

source_arm64=("https://github.com/GyulyVGC/${gives}/releases/download/v${pkgver}/Sniffnet_LinuxDEB_arm64.deb")
sha256sums_arm64=("3b0e7a24b8d263e8c46f7365ca69d0da59ea2b3564014b2d265cfa661b371cc7")

source_armhf=("https://github.com/GyulyVGC/${gives}/releases/download/v${pkgver}/Sniffnet_LinuxDEB_armhf.deb")
sha256sums_armhf=("03369feaf2cf442995425305f022749d65e5a9109407239c776506dd9a3b54b6")
