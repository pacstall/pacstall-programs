name="insync-deb"
pkgname="insync"
version="3.8.1.50459"
repology=("project: insync")
depends="procps pcregrep"
codename="focal"
hash="428be8951c5dd4b35d68edbf029f94b05dd10e3452c49ecdc819d44fdeca0f6d"
if [[ "$(lsb_release -is)" == "Debian" ]]; then
  codename="buster"
  hash="baf1b3c424171d092053c2dd667fa0f167db5a37cd0a94b5eac1bc78d412a1a0"
fi
url="https://cdn.insynchq.com/builds/linux/insync_${version}-${codename}_amd64.deb"
replace="insync"
description="Manage your Google Drive, OneDrive, and Dropbox files straight from your Desktop"
maintainer="Zahrun <Zahrun@github.com>"
