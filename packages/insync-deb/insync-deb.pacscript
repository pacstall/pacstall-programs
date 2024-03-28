pkgname="insync-deb"
gives="insync"
pkgver="3.8.6.50504"
repology=("project: insync")
depends=("procps")
arch=('amd64')
codename="bullseye"
sha256sums=("d74f1a4d2a09f5c8abf5e81717b73cde36ecf6a9a05394845cd8d603e0576e76")
source=("https://cdn.insynchq.com/builds/linux/insync_${pkgver}-${codename}_amd64.deb")
replaces=("insync")
pkgdesc="Manage your Google Drive, OneDrive, and Dropbox files straight from your Desktop"
# vim:set ft=sh ts=2 sw=2 et:
