name="insync-deb"
pkgname="insync"
version="3.7.6.50356"
repology=("project: insync")
depends="procps"
codename="focal"
hash="428be8951c5dd4b35d68edbf029f94b05dd10e3452c49ecdc819d44fdeca0f6d"
if [[ "$(lsb_release -is)" == "Debian" ]]; then
  codename="buster"
  hash="baf1b3c424171d092053c2dd667fa0f167db5a37cd0a94b5eac1bc78d412a1a0"
fi
url="https://d2t3ff60b2tol4.cloudfront.net/builds/${pkgname}_${version}-${codename}_amd64.deb"
replace="insync"
description="Manage your Google Drive, OneDrive, and Dropbox files straight from your Desktop"
maintainer="Zahrun <Zahrun@github.com>"
