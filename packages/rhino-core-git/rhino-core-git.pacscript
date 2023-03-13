name="rhino-core-git"
url="https://github.com/oklopfer/rhino-core.git"
pacdeps=("rhino-linux-xfce4-config-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git")
description="Transitional package to provide all core Rhino Linux software"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
   git ls-remote "${url}" master | cut -f1 | cut -c1-8
 }
 version="$(pkgver)"
