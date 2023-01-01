name="insync-deb"
pkgname="insync"
version="3.8.4.50481"
repology=("project: insync")
depends="procps"
codename="focal"
hash="54ed3ba43e709a19d7f500ab152f2fafaf7da1f813a0ce7f7d9067ae2f7f2f73"
if [[ "$(lsb_release -is)" == "Debian" ]]; then
  codename="bullseye"
  hash="9456e8b26ddd2ab3a61c7a030e7053be30ce278cfaed2c4ea72d02d2707c8ea3"
fi
url="https://cdn.insynchq.com/builds/linux/insync_${version}-${codename}_amd64.deb"
gives="insync"
replace="insync"
description="Manage your Google Drive, OneDrive, and Dropbox files straight from your Desktop"
# vim:set ft=sh ts=2 sw=2 et:
