pkgname="noctalia-deb"
gives="noctalia"
repology=("project: ${gives}")
pkgver="5.0.0~beta.8"
url='https://github.com/noctalia-dev/noctalia'
pkgdesc="A sleek, customizable desktop shell crafted for Wayland"
maintainer=("AJStrong <ajstrongdev@pm.me>")
license=('MIT')
arch=('amd64' 'arm64')
compatible=("debian:trixie" "debian:sid" "ubuntu:resolute" "ubuntu:stonking" "ubuntu:devel")
breaks=("${gives}-git" "${gives}-bin" "${gives}-app" "${gives}-shell" "${gives}-shell-git")
replaces=("${gives}")
_repo="https://pkg.noctalia.dev/deb"

# Debian 13 (trixie)
source_trixie_amd64=("${_repo}/trixie/${gives}_${pkgver}-1+deb13u1_amd64.deb")
sha256sums_trixie_amd64=("9955cfdedb9e0acf0c1bd6c26c1f6848599c5f3590eb16ddd68216207f997f1b")
source_trixie_arm64=("${_repo}/trixie/${gives}_${pkgver}-1+deb13u1_arm64.deb")
sha256sums_trixie_arm64=("b3d88f161bab82d0dd69433543c7caa61a839bc190677f7ce7e7dd7c2a222e10")

# Debian unstable (sid) - Excludes arm64
if [[ ${DISTRO} == "debian:sid" && ${CARCH} == "arm64" ]]; then
  fancy_message error $"Upstream does not ship a %b arm64 build for Debian sid" "${pkgver}"
  exit 1
fi
source_sid_amd64=("${_repo}/unstable/${gives}_${pkgver}-1_amd64.deb")
sha256sums_sid_amd64=("a89af08baf0d384099635342987efff14fac9bd7460fbbe8d89fff611017cb0d")

# Ubuntu 26.04 (resolute) and newer
source_ubuntu_amd64=("${_repo}/resolute/${gives}_${pkgver}-1ubuntu1_amd64.deb")
sha256sums_ubuntu_amd64=("06db444633ea37960c144b766dbda07883b9445350d4376ba85abf978fa1258d")
source_ubuntu_arm64=("${_repo}/resolute/${gives}_${pkgver}-1ubuntu1_arm64.deb")
sha256sums_ubuntu_arm64=("21cdddeb8b598698a0dbaf801dfc262e4584b141ce079ff876c78c68b7201f6b")
