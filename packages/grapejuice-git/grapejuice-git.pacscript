name="grapejuice-git"
pkgdesc="A simple wine+roblox management application"
depends=("git" "python3-pip" "python3-wheel" "python3-dev" "python-is-python3" "pkg-config" "libcairo2-dev" "gtk-update-icon-cache" "desktop-file-utils" "xdg-utils" "libgirepository1.0-dev" "gir1.2-gtk-3.0" "gettext")
url="https://gitlab.com/brinkervii/grapejuice.git"
pkgver="7.11.4"
maintainer="Elsie19 <elsie19@pm.me>"
gives="grapejuice"
breaks=("grapejuice" "grapejuice-bin" "grapejuice-app" "grapejuice-deb")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  export PYTHONPATH="${PWD}/src"
  python3 -m grapejuice_packaging linux_package || python -m grapejuice_packaging linux_package
  cd dist/linux_package
  sudo mkdir -p "${pkgdir}"
  sudo tar -xf ./*.tar.gz -C "${pkgdir}"
}
