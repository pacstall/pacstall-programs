name="grapejuice-git"
description="A simple wine+roblox management application"
depends=("git" "python3-pip" "python3-setuptools" "python3-wheel" "python3-dev" "python-is-python3" "pkg-config" "libcairo2-dev" "gtk-update-icon-cache" "desktop-file-utils" "xdg-utils" "libgirepository1.0-dev" "gir1.2-gtk-3.0" "gettext")
url="https://gitlab.com/brinkervii/grapejuice.git"
maintainer="Henryws <hwengerstickel@pm.me>"
gives="grapejuice"
breaks=("grapejuice" "grapejuice-bin" "grapejuice-app" "grapejuice-deb")

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  export PYTHONPATH="${PWD}/src"
  python3 -m grapejuice_packaging linux_package || python -m grapejuice_packaging linux_package
  cd dist/linux_package
  sudo mkdir -p "${pkgdir}"
  sudo tar -xf ./*.tar.gz -C "${pkgdir}"
}

# vim:set ft=sh ts=2 sw=2 et:
