name="google-chrome-beta-deb"
gives="google-chrome-beta"
repology=("project: google-chrome" "visiblename: google-chrome-beta")
replace=("${gives}")
description="The web browser built by Google - Beta channel"
maintainer="Diegiwg <diegiwg@gmail.com>"
arch=('amd64')

pkgver() {
  curl https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-beta | grep 'amd64.deb' | cut -d'_' -f2
}
version="$(pkgver)"
url="https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-beta/google-chrome-beta_${version}_amd64.deb"
