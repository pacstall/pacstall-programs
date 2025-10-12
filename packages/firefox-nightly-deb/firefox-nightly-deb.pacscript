pkgname="firefox-nightly-deb"
gives="firefox-nightly"
pkgver="144.0a1"
arch=('amd64' 'arm64')
repology=("project: ${gives}")
replaces=("${gives}" "${gives}-bin")
source_amd64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-${pkgver}.en-US.linux-x86_64.deb")
source_arm64=("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-${pkgver}.en-US.linux-aarch64.deb")
url='https://www.mozilla.org/en-US/firefox'
pkgdesc="Free and open-source web browser developed by the Mozilla Foundation (Nightly)"
maintainer=("Oren Klopfer <oren@taumoda.com>")
# builds update daily, so no sha256sums are provided
