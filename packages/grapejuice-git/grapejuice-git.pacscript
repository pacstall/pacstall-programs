pkgname="grapejuice-git"
pkgdesc="A simple wine+roblox management application"
depends=("git" "python3-pip" "python3-wheel" "python3-dev" "python-is-python3" "pkg-config" "libcairo2-dev" "gtk-update-icon-cache" "desktop-file-utils" "xdg-utils" "libgirepository1.0-dev" "gir1.2-gtk-3.0" "gettext")
source=("https://gitlab.com/brinkervii/grapejuice.git")
arch=("any")
pkgver="7.11.4"
maintainer=("Elsie19 <elsie19@pm.me>")
gives="grapejuice"
breaks=("grapejuice" "grapejuice-bin" "grapejuice-app" "grapejuice-deb")

package() {
  cd "grapejuice"
  export PYTHONPATH="${PWD}/src"
  python3 -m grapejuice_packaging linux_package || python -m grapejuice_packaging linux_package
  cd dist/linux_package
  mkdir -p "${pkgdir}"
  tar -xf ./*.tar.gz -C "${pkgdir}"
}

# vim:set ft=sh ts=2 sw=2 et:
