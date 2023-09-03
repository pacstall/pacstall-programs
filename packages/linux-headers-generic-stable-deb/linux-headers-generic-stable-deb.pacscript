name="linux-headers-generic-stable-deb"
gives="linux-headers-6.5.1-060501-generic"
pkgver="6.5.1"
buildver="6.5.1-060501.202309020842"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  hash="462b96fe7695569bb9770e4169bcc705bead5875ee20c56922da7ea7464acf5d"
else
  hash="eb32bcd0b63c4b2204a42813c3c104607856256e703e995112df46796401caa6"
fi
url="https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb"
pkgdesc="Ubuntu Linux stable kernel (Generic headers)"
maintainer="Oren Klopfer <oren@taumoda.com>"
repology=("project: linux" "repo: distrowatch")
